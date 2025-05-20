import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/functions/show_custom_snack_bar.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/custom_widgets/google_button.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login/do_not_have_account.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/login/login_fields.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/authentication_cubit_states.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Text(
            'Login',
            style: Styles.interBold40.copyWith(
              color: AppColor.textWhiteColor,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) {
                  if (state is FailureState) {
                    showCustomSnackBar(context, state.errorMessage);
                  } else if (state is SuccessState) {
                    Navigator.pushReplacementNamed(context, '/navigationHome');
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Column(
                    children: [
                      LoginFields(
                        emailController: emailController,
                        passwordController: passwordController,
                        formKey: formKey,
                      ),
                      CustomButton(
                        text: 'Login',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<AuthenticationCubit>().signIn(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      GoogleButton(text: 'login'),
                    ],
                  );
                },
              ),
            ),
          ),
          const DoNotHaveAccount(),
        ],
      ),
    );
  }
}
