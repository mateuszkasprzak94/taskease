import 'package:flutter/material.dart';
import 'package:to_do/app/widgets/animations/animation.dart';

class AddTaskBody extends StatelessWidget {
  const AddTaskBody({
    required this.onDeadLineChanged,
    required this.onTitleChanged,
    required this.onTypeChanged,
    required this.selectedDateFormatted,
    required this.titleController,
    required this.selectedTaskType,
  });

  final Function(DateTime?) onDeadLineChanged;
  final Function(String?) onTitleChanged;
  final Function(String?) onTypeChanged;
  final String? selectedDateFormatted;
  final TextEditingController titleController;
  final String? selectedTaskType;

  @override
  Widget build(BuildContext context) {
    List<String> taskType = ['Basic', 'Important', 'Urgent'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const FadeInAnimation(
            delay: 1.3,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Task DeadLine',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
          ),
          FadeInAnimation(
            delay: 1.6,
            child: TextField(
              focusNode: AlwaysDisabledFocusNode(),
              readOnly: true,
              enableInteractiveSelection: false,
              decoration: InputDecoration(
                isCollapsed: true,
                label: Text(selectedDateFormatted ?? ''),
                labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                suffixIcon: GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(
                        const Duration(days: 365 * 10),
                      ),
                    );
                    onDeadLineChanged(selectedDate);
                  },
                  child: const Icon(
                    Icons.calendar_month,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const FadeInAnimation(
            delay: 1.9,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Task Title',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
            ),
          ),
          FadeInAnimation(
            delay: 2.1,
            child: TextField(
              controller: titleController,
              onChanged: onTitleChanged,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const FadeInAnimation(
                delay: 2.4,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Task Type',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
              ),
              FadeInAnimation(
                delay: 2.7,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Ink(
                    width: 240,
                    height: 50,
                    color: Colors.white,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      childAspectRatio: 2.5,
                      children: List.generate(
                        taskType.length,
                        (index) {
                          return InkWell(
                            splashColor: Colors.transparent,
                            onTap: () {
                              onTypeChanged(taskType[index]);
                            },
                            child: Ink(
                              decoration: BoxDecoration(
                                color: taskType[index] == selectedTaskType
                                    ? Colors.black
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Colors.black),
                              ),
                              child: Center(
                                child: Text(
                                  taskType[index],
                                  style: TextStyle(
                                      color: taskType[index] == selectedTaskType
                                          ? Colors.white
                                          : Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              FadeInAnimation(
                delay: 3,
                child: TextField(
                  enabled: false,
                  readOnly: true,
                  focusNode: AlwaysDisabledFocusNode(),
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: -10),
                    isCollapsed: true,
                    isDense: true,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
