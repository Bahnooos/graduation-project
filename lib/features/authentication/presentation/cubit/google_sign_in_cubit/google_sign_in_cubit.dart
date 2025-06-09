import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit_states.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final AuthenticationRepository authRepository;

  GoogleSignInCubit(this.authRepository) : super(GoogleSignInInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    try {
      final user = await authRepository.signInWithGoogle();
      if (user != null) {
        emit(GoogleSignInSuccess(user));
      } else {
        emit(GoogleSignInFailure("Sign in canceled."));
      }
    } catch (e) {
      emit(GoogleSignInFailure("Google Sign-In failed: ${e.toString()}"));
    }
  }
}
