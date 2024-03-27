import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/core/constants.dart';
import 'package:to_do/app/domain/models/item_model.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/cubit/tab_screen_cubit.dart';

class TabCardWidget extends StatelessWidget {
  const TabCardWidget({
    super.key,
    required this.itemModel,
  });

  final ItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    bool isChecked = itemModel.isChecked;
    Color taskColor = getTaskColor(itemModel.taskType);
    double screenWidth = MediaQuery.of(context).size.width;

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
              Text(
                itemModel.releaseDateFormatted(),
                style: TextStyle(
                  fontSize: screenWidth / 29,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Days left:',
                style: TextStyle(
                    fontSize: screenWidth / 28, fontStyle: FontStyle.italic),
              ),
              Text(
                itemModel.daysLeft(),
                style: TextStyle(
                  color: int.parse(itemModel.daysLeft()) < 5
                      ? Colors.red
                      : Colors.green,
                  fontSize: screenWidth / 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: Checkbox(
            value: isChecked,
            onChanged: (value) {
              context
                  .read<TabScreenCubit>()
                  .updateCheckbox(documentID: itemModel.id, isChecked: value!);
            },
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
