import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/custom_background.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/login/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: CustomBackground(
          body: LoginViewBody(),
        ),
      ),
    );
  }
}
