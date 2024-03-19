import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          'New Task',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          GestureDetector(
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
                color: _deadLine != null || _title != null || _taskType != null
                    ? const Color.fromARGB(255, 223, 41, 28)
                    : Colors.grey,
              ),
            ),
          ),
        ],
      ),
      body: _AddTaskBody(
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
      ),
    );
  }
}

class _AddTaskBody extends StatelessWidget {
  const _AddTaskBody({
    required this.onDeadLineChanged,
    required this.onTitleChanged,
    required this.onTypeChanged,
    required this.selectedDateFormatted,
    required this.titleController,
  });

  final Function(DateTime?) onDeadLineChanged;
  final Function(String?) onTitleChanged;
  final Function(String?) onTypeChanged;
  final String? selectedDateFormatted;
  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [false, false, false];
    List<String> taskType = ['Basic', 'Important', 'Urgent'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Task DeadLine',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
          TextField(
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
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Task Title',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
          ),
          TextField(
            controller: titleController,
            onChanged: onTitleChanged,
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Task Type',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
              ),
              Padding(
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
                      isSelected.length,
                      (index) {
                        return InkWell(
                          splashColor: Colors.transparent,
                          onTap: () {
                            onTypeChanged(taskType[index]);
                            print(taskType[index]);
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              color: isSelected[index]
                                  ? Colors.black
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Center(
                              child: Text(
                                taskType[index],
                                style: TextStyle(
                                    color: isSelected[index]
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
              TextField(
                enabled: false,
                readOnly: true,
                focusNode: AlwaysDisabledFocusNode(),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: -10),
                  isCollapsed: true,
                  isDense: true,
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
