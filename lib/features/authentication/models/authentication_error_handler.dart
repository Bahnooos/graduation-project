class AuthenticationErrorHandler {
  static String registration(String code) {
    switch (code) {
      case 'email-already-in-use':
        return "The email is already in use.";
      case 'weak-password':
        return "The password is too weak.";
      case 'invalid-email':
        return "The email format is invalid.";
      case 'network-request-failed':
        return "Please check your internet connection.";
      default:
        return "Registration failed. Please try again.";
    }
  }

  static String login(String code) {
    switch (code) {
      case 'user-not-found':
        return "No user found with this email.";
      case 'wrong-password':
        return "Incorrect password.";
      case 'invalid-email':
        return "Invalid email format.";
      case 'user-disabled':
        return "This account has been disabled.";
      case 'network-request-failed':
        return "Please check your internet connection.";
      default:
        return "Login failed. Please try again.";
    }
  }

  static String forgetPassword(String code) {
    switch (code) {
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
}
