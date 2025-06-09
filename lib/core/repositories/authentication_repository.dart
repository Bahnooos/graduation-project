import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/core/repositories/user_data_repository.dart';

class AuthenticationRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserModel> registerWithEmail(
      String email, String password, String username) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final user = credential.user;
    if (user == null) throw Exception("User is null after registration.");

    await user.updateDisplayName(username);
    await user.reload();

    await sendVerificationEmail(user);

    return UserModel.fromFirebaseUser(_auth.currentUser!);
  }

  Future<void> sendVerificationEmail(User user) async {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  Future<UserModel> loginWithEmail(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    final user = credential.user;
    if (user == null) throw Exception("Login failed. User is null.");

    return UserModel.fromFirebaseUser(user);
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    if (googleUser == null) return null;

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> isEmailVerified() async {
    await _auth.currentUser?.reload();
    return _auth.currentUser?.emailVerified ?? false;
  }

  Future<void> deleteUserIfNotVerified() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.delete();
    }
  }

  UserModel? get currentUser {
    final user = _auth.currentUser;
    return user != null ? UserModel.fromFirebaseUser(user) : null;
  }
}
