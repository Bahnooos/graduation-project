import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/custom_background.dart';
import 'package:graduation_project/core/repositories/authentication_repository.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/forget_password/forget_password_view_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        AuthenticationRepository(),
      ),
      child: Scaffold(
        body: CustomBackground(
          body: ForgetPasswordViewBody(),
        ),
      ),
    );
  }
}
