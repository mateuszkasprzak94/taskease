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
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(
                Icons.delete,
                color: Color.fromARGB(255, 223, 41, 28),
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
  });

  final Function(DateTime?) onDeadLineChanged;
  final Function(String) onTitleChanged;
  final Function(String?) onTypeChanged;
  final String? selectedDateFormatted;

  @override
  Widget build(BuildContext context) {
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
          const TextField(),
          const SizedBox(height: 20),
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
          const TextField(),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
