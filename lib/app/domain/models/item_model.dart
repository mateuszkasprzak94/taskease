class ItemModel {
  const ItemModel({
    required this.id,
    required this.deadLine,
    required this.title,
    required this.taskType,
  });
  final String id;
  final DateTime deadLine;
  final String title;
  final String taskType;
}
