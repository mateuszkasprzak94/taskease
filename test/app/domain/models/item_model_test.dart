import 'package:flutter_test/flutter_test.dart';
import 'package:to_do/app/domain/models/item_model.dart';

void main() {
  group('ItemModel', () {
    test('should releaseDateFormatted return formatted date as String', () {
      // 1
      final model = ItemModel(
          id: '1',
          deadline: DateTime(2024, 04, 03),
          title: 'Some Title',
          taskType: 'Important',
          isChecked: false);

      // 2
      final formattedDate = model.releaseDateFormatted();

      //
      expect(formattedDate, 'April 3, 2024');
    });

    test('daysLeft method should return difference in days', () {
      // 1
      final model = ItemModel(
          id: '1',
          deadline: DateTime(2024, 04, 03),
          title: 'Some Title',
          taskType: 'Urgent',
          isChecked: false);

      // 2
      final daysLeft = model.daysLeft();

      // 3
      expect(daysLeft, '0');
    });
  });
}
