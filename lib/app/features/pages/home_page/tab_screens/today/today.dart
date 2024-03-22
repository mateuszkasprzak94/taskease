import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/domain/models/item_model.dart';
import 'package:to_do/app/domain/repositories/items_repository.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/cubit/tab_screen_cubit.dart';

class TodayTab extends StatelessWidget {
  const TodayTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => TabScreenCubit(ItemsRepository())..start(),
      child: BlocBuilder<TabScreenCubit, TabScreenState>(
        builder: (context, state) {
          final itemModels = state.items;

          return ListView(
            children: [
              for (final itemModel in itemModels)
                Dismissible(
                  key: ValueKey(itemModel.id),
                  background: const DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 32.0),
                        child: Icon(
                          Icons.delete,
                        ),
                      ),
                    ),
                  ),
                  confirmDismiss: (direction) async {
                    // only from right to left
                    return direction == DismissDirection.endToStart;
                  },
                  onDismissed: (direction) {
                    context
                        .read<TabScreenCubit>()
                        .remove(documentID: itemModel.id);
                  },
                  child: TabCardWidget(
                    itemModel: itemModel,
                  ),
                ),
            ],
          );
        },
      ),
    ));
  }
}

class TabItemWidget extends StatelessWidget {
  const TabItemWidget({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    Color taskColor = getTaskColor(itemModel.taskType);
    Color taskColorBorder = getTaskColorBorder(itemModel.taskType);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: taskColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: taskColorBorder,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemModel.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    size: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      itemModel.releaseDateFormatted(),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Column(
            children: [],
          ),
        ],
      ),
    );
  }
}

class TabCardWidget extends StatelessWidget {
  const TabCardWidget({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;
  @override
  Widget build(BuildContext context) {
    Color taskColor = getTaskColor(itemModel.taskType);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Card(
        color: taskColor,
        child: ListTile(
          leading: const Icon(Icons.event),
          title: Text(
            itemModel.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(itemModel.releaseDateFormatted()),
              const Text('Days left:'),
              Text(
                itemModel.daysLeft(),
                style: TextStyle(
                  color: int.parse(itemModel.daysLeft()) < 5
                      ? Colors.red
                      : Colors.green,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: Checkbox(
            value: false,
            onChanged: (bool? newValue) {},
          ),
        ),
      ),
    );
  }
}
