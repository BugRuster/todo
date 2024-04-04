import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference taskCollection =
  FirebaseFirestore.instance.collection('Tasks');
  final CollectionReference categoryCollection =
  FirebaseFirestore.instance.collection('Categories');

  // Add a new category
  Future addCategory(String categoryName) async {
    return await categoryCollection.doc(categoryName).set({'name': categoryName});
  }

  // Delete a category
  Future deleteCategory(String categoryName) async {
    return await categoryCollection.doc(categoryName).delete();
  }

  // Stream of categories
  Stream<QuerySnapshot> get categories {
    return categoryCollection.snapshots();
  }

  // Add a new task
  Future addTask(Map<String, dynamic> taskData) async {
    String id = FirebaseFirestore.instance.collection('Tasks').doc().id;
    return await taskCollection.doc(id).set(taskData);
  }

  // Stream of tasks for a specific category
  Stream<QuerySnapshot> getTasks(String category) {
    return taskCollection.where('category', isEqualTo: category).snapshots();
  }

  // Update a task
  Future updateTask(String taskId, Map<String, dynamic> updatedData) async {
    return await taskCollection.doc(taskId).update(updatedData);
  }

  // Delete a task
  Future deleteTask(String taskId) async {
    return await taskCollection.doc(taskId).delete();
  }
}
