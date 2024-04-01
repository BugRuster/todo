import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Future addPersonalTask(
      Map<String, dynamic> userPersonalMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('Personal')
        .doc(id)
        .set(userPersonalMap);
  }
  Future addCollegeTask(
      Map<String, dynamic> userPersonalMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('College')
        .doc(id)
        .set(userPersonalMap);
  }
  Future addHomeTask(
      Map<String, dynamic> userPersonalMap, String id) async {
    return await FirebaseFirestore.instance
        .collection('Homne')
        .doc(id)
        .set(userPersonalMap);
  }
}
