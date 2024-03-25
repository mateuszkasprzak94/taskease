import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/app/features/pages/home_page/tab_screens/cubit/tab_screen_cubit.dart';
import 'package:to_do/app/features/pages/home_page/widgets/tab_card_widget.dart';

class FailedTab extends StatelessWidget {
  const FailedTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<TabScreenCubit, TabScreenState>(
      builder: (context, state) {
        final itemModels = state.failedTasks;

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
    ));
  }
}
