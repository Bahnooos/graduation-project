String registrationErrorHandler(String code) {
  switch (code) {
    case 'email-already-in-use':
      return "The email is already in use.";
    case 'weak-password':
      return "The password is too weak.";
    case 'invalid-email':
      return "The email format is invalid.";
    default:
      return "Registration failed. Please try again.";
  }
}
