import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/models/user.dart';
import 'package:happy_hour_app/screens/authentication/authentication_bloc.dart';
import 'package:happy_hour_app/screens/authentication/form_values.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_forgot_password.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_toggle.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_label.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/utils/validation_helper.dart';

final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  static List<FormValues> formValues = [
    FormValues(
      hintText: "JohnDoe@example.com",
      textFieldName: "Email",
      errorValidationMessage: "Please enter correct email address",
    ),
    FormValues(
      hintText: "********",
      textFieldName: "Password",
      errorValidationMessage:
          "Your password must be have at least 1 uppercase & 1 lowercase character, 1 number and 8 characters long",
    ),
  ];

  final Map<String, dynamic> user = {};

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.red,
              content: Text(state.error),
            ),
          );
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Form(
            key: _keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildFormFields(),
                _buildForgotPasswordButton(),
                _buildSignInButton(context),
                _buildToggleToSignUp(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextFieldWithLabel({
    required String hintText,
    required String textFieldName,
    required int index,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomLabel(textFieldName: textFieldName),
          CustomTextField(
            hintText: hintText,
            isPassword: formValues[index] == formValues.last,
            validator: (value) => value!.isEmpty
                ? "Enter Your ${formValues[index].textFieldName}"
                : ValidationHelper.getValidation(
                    value,
                    textFieldName,
                  )
                    ? formValues[index].errorValidationMessage
                    : null,
            onChanged: (value) {
              user[textFieldName] = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: List.generate(
        formValues.length,
        (index) => _buildTextFieldWithLabel(
          textFieldName: formValues[index].textFieldName,
          hintText: formValues[index].hintText,
          index: index,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return const ForgotPassword();
  }

  Widget _buildSignInButton(BuildContext context) {
    return CustomButton(
      buttonTitle: "Sign in",
      callback: () {
        if (_keyForm.currentState!.validate()) {
          UserModel userModel = UserModel(
            email: user["Email"],
            password: user["Password"],
          );

          BlocProvider.of<AuthenticationBloc>(context)
              .add(SignIn(userModel: userModel));
        }
      },
    );
  }

  Widget _buildToggleToSignUp(BuildContext context) {
    return AuthToggle(
        callback: () => context.go(Constants.signUpRouteName),
        label: "Don't have an account?",
        textButton: 'Sign up');
  }
}
