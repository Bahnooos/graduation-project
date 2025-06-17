import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/custom_background.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';
import 'package:graduation_project/features/authentication/models/user_data_repository.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/registration_cubit/registration_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationCubit(
        AuthenticationRepository(),
        UserDataRepository(),
      ),
      child: Scaffold(
        body: CustomBackground(
          body: SignUpViewBody(),
        ),
      ),
    );
  }
}
