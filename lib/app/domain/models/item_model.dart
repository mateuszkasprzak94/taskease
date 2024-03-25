import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemModel {
  const ItemModel({
    required this.id,
    required this.deadline,
    required this.title,
    required this.taskType,
    required this.isChecked,
  });
  final String id;
  final DateTime deadline;
  final String title;
  final String taskType;
  final bool isChecked;

  String releaseDateFormatted() {
    return DateFormat.yMMMMd().format(deadline);
  }

  String daysLeft() {
    final now = DateTime.now();
    final deadlineDate = DateUtils.dateOnly(deadline);
    final difference = deadlineDate.difference(DateUtils.dateOnly(now));
    final differenceInDays = difference.inDays;

    return differenceInDays.toString();
  }
}
