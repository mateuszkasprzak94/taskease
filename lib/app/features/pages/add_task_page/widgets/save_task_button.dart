import 'package:flutter/material.dart';
import 'package:to_do/app/widgets/animations/animation.dart';

class SaveTaskButton extends StatelessWidget {
  const SaveTaskButton({
    super.key,
    required DateTime? deadline,
    required String? title,
    required String? taskType,
    required this.values,
  })  : _deadline = deadline,
        _title = title,
        _taskType = taskType;

  final DateTime? _deadline;
  final String? _title;
  final String? _taskType;
  final bool values;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _deadline == null || _title == null || _taskType == null
          ? null
          : () {},
      child: FadeInAnimation(
        delay: 3.3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
              color: values ? Colors.grey : Colors.black,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Save Task',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
