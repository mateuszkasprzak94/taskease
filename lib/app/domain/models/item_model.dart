import 'package:intl/intl.dart';

class ItemModel {
  const ItemModel({
    required this.id,
    required this.deadline,
    required this.title,
    required this.taskType,
  });
  final String id;
  final DateTime deadline;
  final String title;
  final String taskType;

  String releaseDateFormatted() {
    return DateFormat.yMMMMd().format(deadline);
  }
}
