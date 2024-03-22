import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do/app/domain/models/item_model.dart';

class ItemsRepository {
  Stream<List<ItemModel>> getItemsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('tasks')
        .orderBy('deadline')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map(
        (doc) {
          return ItemModel(
            id: doc.id,
            deadline: (doc['deadline'] as Timestamp).toDate(),
            title: doc['title'],
            taskType: doc['task_type'],
            isChecked: doc['is_checked'],
          );
        },
      ).toList();
    });
  }

  Future<void> add(
    DateTime deadline,
    String title,
    String taskType,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('tasks')
        .add(
      {
        'deadline': deadline,
        'title': title,
        'task_type': taskType,
        'is_checked': false,
      },
    );
  }

  Future<void> update({required String id, required bool isChecked}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('tasks')
        .doc(id)
        .update({
      'is_checked': isChecked,
    });
  }

  Future<void> delete({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('tasks')
        .doc(id)
        .delete();
  }
}
