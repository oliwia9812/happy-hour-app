import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/generated/app_icons.dart';
import 'package:happy_hour_app/screens/authentication/forgot_password/forgot_password_bloc.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_header.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_label.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_text_field.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/styles/app_decorations.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hour_app/screens/authentication/validation.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});

  String email = "";

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: AppColors.red,
            ),
          );
        }
        if (state is ResetPasswordSuccess) {
          context.go(Constants.resetPasswordSuccessRouteName);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 84.0),
          child: Stack(
            children: [
              _buildBackButton(context),
              _buildHeader(),
              _buildForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: ElevatedButton(
        style: AppDecorations.roundedButton,
        onPressed: () {
          context.go(Constants.signInRouteName);
        },
        child: const Icon(
          AppIcons.arrowBack,
          color: AppColors.gray,
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Positioned(
      top: 64.0,
      child: AuthHeader(
        headerTitle: "Reset your password",
        subtitle: "Enter your registered email",
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
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
                email = value;
              }
            },
          ),
          const SizedBox(
            height: 32.0,
          ),
          CustomButton(
            buttonTitle: "Send",
            callback: () {
              if (_formKey.currentState!.validate()) {
                BlocProvider.of<ForgotPasswordBloc>(context)
                    .add(ResetPassword(email: email));
              }
            },
          ),
        ],
      ),
    );
  }
}
