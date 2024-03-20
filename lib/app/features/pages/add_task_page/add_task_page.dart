import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do/app/features/pages/add_task_page/widgets/add_task_body.dart';
import 'package:to_do/app/features/pages/add_task_page/widgets/save_task_button.dart';
import 'package:to_do/app/widgets/animations/animation.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? _deadLine;
  String? _title;
  String? _taskType;

  final TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final values = _deadLine == null || _title == null || _taskType == null;
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const FadeInAnimation(
            delay: 1,
            child: Text(
              'New Task',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            FadeInAnimation(
              delay: 1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _deadLine = null;
                    _title = null;
                    _taskType = null;
                    _titleController.clear();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.delete,
                    color:
                        _deadLine != null || _title != null || _taskType != null
                            ? const Color.fromARGB(255, 223, 41, 28)
                            : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                AddTaskBody(
                  onDeadLineChanged: (newValue) {
                    setState(() {
                      _deadLine = newValue;
                    });
                  },
                  onTitleChanged: (newValue) {
                    setState(() {
                      _title = newValue;
                    });
                  },
                  onTypeChanged: (newValue) {
                    setState(() {
                      _taskType = newValue;
                    });
                  },
                  selectedDateFormatted: _deadLine == null
                      ? null
                      : DateFormat.yMMMMEEEEd().format(_deadLine!),
                  titleController: _titleController,
                  selectedTaskType: _taskType,
                ),
              ],
            ),
            SaveTaskButton(
                deadLine: _deadLine,
                title: _title,
                taskType: _taskType,
                values: values),
          ],
        ),
      ),
    );
  }
}
