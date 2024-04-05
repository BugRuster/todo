import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference taskCollection =
      FirebaseFirestore.instance.collection('Tasks');
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference linkCollection =
    FirebaseFirestore.instance.collection('Links');

  // Add a new category
  Future addCategory(String categoryName) async {
    return await categoryCollection
        .doc(categoryName)
        .set({'name': categoryName});
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


  // Add a new link
  Future addLink(Map<String, dynamic> linkData) async {
    String id = FirebaseFirestore.instance.collection('Links').doc().id;
    return await linkCollection.doc(id).set(linkData);
  }

  // Stream of links for a specific category
  Stream<QuerySnapshot> getLinks(String category) {
    print('Querying for category: $category');
    return linkCollection.where('category', isEqualTo: category).snapshots();
  }

  // Update a link (if needed)
  Future updateLink(String linkId, Map<String, dynamic> updatedData) async {
    return await linkCollection.doc(linkId).update(updatedData);
  }

  // Delete a link
  Future deleteLink(String linkId) async {
    return await linkCollection.doc(linkId).delete();
  }

  // Retrieve all links as a Stream
  Stream<QuerySnapshot> getAllLinks() {
    return linkCollection.snapshots();
  }
}
