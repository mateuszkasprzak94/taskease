import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do/app/core/enums.dart';
import 'package:to_do/app/features/pages/add_task_page/cubit/add_task_cubit.dart';
import 'package:to_do/app/features/pages/add_task_page/widgets/add_task_body.dart';
import 'package:to_do/app/features/pages/add_task_page/widgets/save_task_button.dart';
import 'package:to_do/app/injection_container.dart';
import 'package:to_do/app/widgets/animations/animation.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? _deadline;
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
    final values = _deadline == null || _title == null || _taskType == null;
    return BlocProvider<AddTaskCubit>(
      create: (context) => getIt(),
      child: BlocConsumer<AddTaskCubit, AddTaskState>(
        listener: (context, state) {
          final errorMessage = state.errorMessage ?? 'Unknown error';
          if (state.status == Status.success) {
            Navigator.of(context).pop();
          }
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
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
                          _deadline = null;
                          _title = null;
                          _taskType = null;
                          _titleController.clear();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.delete,
                          color: _deadline != null ||
                                  _title != null ||
                                  _taskType != null
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
                        onDeadlineChanged: (newValue) {
                          setState(() {
                            _deadline = newValue;
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
                        selectedDateFormatted: _deadline == null
                            ? null
                            : DateFormat.yMMMMEEEEd().format(_deadline!),
                        titleController: _titleController,
                        selectedTaskType: _taskType,
                      ),
                    ],
                  ),
                  SaveTaskButton(
                      deadline: _deadline,
                      title: _title,
                      taskType: _taskType,
                      values: values),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
