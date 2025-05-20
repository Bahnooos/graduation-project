import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/functions/show_custom_snack_bar.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/custom_widgets/google_button.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/signUp/already_have_account.dart';
import 'package:graduation_project/features/authentication/presentation/widgets/signUp/sign_up_fields.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/authentication_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/authentication_cubit_states.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Text(
            'Signup',
            style: Styles.interBold40.copyWith(
              color: AppColor.textWhiteColor,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
                listener: (context, state) async {
                  if (state is FailureState) {
                    showCustomSnackBar(context, state.errorMessage);
                  } else if (state is LoggedOutState) {
                    Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [
                      SignUpFields(
                        userNameController: userNameController,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        formKey: formKey,
                      ),
                      CustomButton(
                        text: 'Signup',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            context.read<AuthenticationCubit>().register(
                                  context,
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                );
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      GoogleButton(text: 'signup'),
                    ],
                  );
                },
              ),
            ),
          ),
          const AlreadyHaveAccount(),
        ],
      ),
    );
  }
}
