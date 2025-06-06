String loginErrorHandler(String code) {
  switch (code) {
    case 'user-not-found':
      return "No user found with this email.";
    case 'wrong-password':
      return "Incorrect password.";
    case 'invalid-email':
      return "Invalid email format.";
    case 'user-disabled':
      return "This account has been disabled.";
    default:
      return "Login failed. Please try again.";
  }
}
