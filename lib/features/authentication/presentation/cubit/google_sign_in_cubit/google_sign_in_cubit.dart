import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/google_sign_in_cubit/google_sign_in_cubit_states.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';
import 'package:graduation_project/core/local_storage/auth_local_storage.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final AuthenticationRepository authRepo;

  GoogleSignInCubit(this.authRepo) : super(GoogleSignInInitial());

  Future<void> signInWithGoogle() async {
    try {
      emit(GoogleSignInLoading());
      final user = await authRepo.signInWithGoogle();

      await AuthLocalStorage.saveLoginStatus(true);

      emit(GoogleSignInSuccess(user));
    } catch (e) {
      emit(GoogleSignInFailure(e.toString()));
    }
  }
}
