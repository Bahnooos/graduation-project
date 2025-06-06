import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utils/app_color.dart';
import 'package:graduation_project/core/utils/styles.dart';
import 'package:graduation_project/core/widgets/custom_button.dart';
import 'package:graduation_project/features/authentication/functions/loading_overlay.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/verification_dialog.dart';
import 'package:graduation_project/features/authentication/functions/show_custom_snack_bar.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/registration_cubit/registration_cubit.dart';
import 'package:graduation_project/features/authentication/presentation/cubit/registration_cubit/registration_cubit_states.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/custom_widgets/google_button.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/already_have_account.dart';
import 'package:graduation_project/features/authentication/presentation/views/widgets/signUp/sign_up_fields.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();
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
              child: BlocConsumer<RegistrationCubit, RegistrationState>(
                listener: (context, state) async {
                  if (state is RegistrationLoadingState) {
                    showLoadingOverlay(context);
                  } else {
                    hideLoadingOverlay(context);
                  }
                  if (state is RegistrationFailureState) {
                    showCustomSnackBar(context, state.errorMessage);
                  }

                  if (state is UnderVerificationState) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.black.withOpacity(0.3),
                      builder: (dialogContext) => BlocProvider.value(
                        value: context.read<RegistrationCubit>(),
                        child: const VerificationDialog(),
                      ),
                    );
                  }
                },
                builder: (context, state) {
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
                            context.read<RegistrationCubit>().register(
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
