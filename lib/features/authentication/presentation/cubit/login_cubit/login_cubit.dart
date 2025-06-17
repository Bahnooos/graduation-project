import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/models/authentication_error_handler.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/login_cubit/login_cubit_states.dart';
import 'package:graduation_project/core/local_storage/auth_local_storage.dart';

class LoginCubit extends Cubit<LoginCubitState> {
  final AuthenticationRepository authRepo;

  LoginCubit(this.authRepo) : super(LoginInitialState());

  Future<void> signIn(String email, String password) async {
    emit(LoginLoadingState());
    try {
      await authRepo.loginWithEmail(email, password);
      await AuthLocalStorage.saveLoginStatus(true);

      emit(LoginSuccessState(FirebaseAuth.instance.currentUser!));
    } on FirebaseAuthException catch (e) {
      emit(LoginFailureState(AuthenticationErrorHandler.login(e.code)));
    } catch (e) {
      emit(LoginFailureState("Unexpected error: $e"));
    }
  }

  Future<void> signOut() async {
    await authRepo.signOut();
    emit(LoginInitialState());
  }
}
