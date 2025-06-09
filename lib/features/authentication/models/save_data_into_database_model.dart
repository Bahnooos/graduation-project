import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:graduation_project/core/repositories/user_data_repository.dart';

class UserDataRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(User user) async {
    try {
      final userModel = UserModel.fromFirebaseUser(user);
      await _firestore.collection('users').doc(user.uid).set(userModel.toMap());
    } catch (e) {
      throw Exception('Failed to save user data: $e');
    }
  }
}
