import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/functions/login_functions/login_error_handler.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/login_cubit/login_cubit_states.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  LoginCubit() : super(LoginInitialState());

  Future<void> signIn(String email, String password) async {
    emit(LoginLoadingState());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final user = userCredential.user;

      if (user != null) {
        emit(LoginSuccessState(user));
      } else {
        emit(LoginFailureState("Login failed. Please try again."));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailureState(loginErrorHandler(e.code)));
    } catch (e) {
      emit(LoginFailureState("Unexpected error: $e"));
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    emit(LoginInitialState());
  }
}
