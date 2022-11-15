import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/reset_password_screen.dart';
import 'package:happy_hour_app/screens/authentication/validation.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_label.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_text_field.dart';
import 'package:happy_hour_app/styles/app_colors.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordLoading) {
          setState(() {
            _loading = true;
          });
        }
        if (state is ForgotPasswordFailure) {
          setState(() {
            _loading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.red,
              content: Text(state.error),
            ),
          );
        }
        if (state is ForgotPasswordSuccess) {
          setState(() {
            _loading = false;
          });
          Navigator.pushNamed(context, ResetPasswordScreen.route);
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomLabel(textFieldName: "Email"),
            CustomTextField(
              hintText: "JohnDoe@example.com",
              validator: (value) => value!.isEmpty
                  ? "Enter your email"
                  : value.isEmailValid()
                      ? "Please enter correct email address"
                      : null,
              onChanged: (value) {
                if (value != null) {
                  _email = value;
                }
              },
            ),
            const SizedBox(
              height: 32.0,
            ),
            CustomButton(
                buttonTitle: "Send",
                loading: _loading,
                callback: () {
                  if (_formKey.currentState!.validate()) {
                    context
                        .read<ForgotPasswordCubit>()
                        .forgotPassword(email: _email);
                  }
                })
          ],
        ),
      ),
    );
  }
}
