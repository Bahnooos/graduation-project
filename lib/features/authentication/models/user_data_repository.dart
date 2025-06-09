import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/repositories/user_model.dart';

class UserDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(UserModel userModel) async {
    try {
      await _firestore
          .collection('users')
          .doc(userModel.uid)
          .set(userModel.toMap(), SetOptions(merge: true));
    } catch (e) {
      throw Exception('Failed to save user data: $e');
    }
  }

  Future<UserModel?> fetchUserData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return null;

    final doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    } else {
      return null;
    }
  }
}
