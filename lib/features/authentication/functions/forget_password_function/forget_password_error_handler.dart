import 'package:firebase_auth/firebase_auth.dart';

String getForgetPasswordErrorMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return "No user found with this email.";
    case 'invalid-email':
      return "Invalid email format.";
    case 'network-request-failed':
      return "Please check your internet connection.";
    default:
      return "Password reset failed. Please try again.";
  }
}
