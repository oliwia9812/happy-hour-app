import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/models/user_model.dart';
import 'package:happy_hour_app/screens/authentication/form_values.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/cubit/sign_in_cubit.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/widgets/sign_in_forgot_password.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/sign_up_screen.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_toggle.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_label.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_text_field.dart';
import 'package:happy_hour_app/screens/home/home_screen.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/utils/validation_helper.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final Map<String, dynamic> _user = {};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _loading = false;

  final List<FormValues> _formValues = [
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          setState(() {
            _loading = true;
          });
        }

        if (state is SignInFailure) {
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
        if (state is SignInSuccess) {
          Navigator.pushNamed(context, HomeScreen.route);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Form(
          key: _formKey,
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
      ),
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
            isPassword: _formValues[index] == _formValues.last,
            validator: (value) => value!.isEmpty
                ? "Enter Your ${_formValues[index].textFieldName}"
                : ValidationHelper.getValidation(
                    value,
                    textFieldName,
                  )
                    ? _formValues[index].errorValidationMessage
                    : null,
            onChanged: (value) {
              _user[textFieldName] = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: List.generate(
        _formValues.length,
        (index) => _buildTextFieldWithLabel(
          textFieldName: _formValues[index].textFieldName,
          hintText: _formValues[index].hintText,
          index: index,
        ),
      ),
    );
  }

  Widget _buildForgotPasswordButton() {
    return const ForgotPasswordWidget();
  }

  Widget _buildSignInButton(BuildContext context) {
    return CustomButton(
      buttonTitle: "Sign in",
      loading: _loading,
      callback: () {
        if (_formKey.currentState!.validate()) {
          UserModel userModel = UserModel(
            email: _user["Email"],
            password: _user["Password"],
          );

          context
              .read<SignInCubit>()
              .signIn(email: userModel.email, password: userModel.password);
        }
      },
    );
  }

  Widget _buildToggleToSignUp(BuildContext context) {
    return AuthToggle(
        callback: () => Navigator.pushNamed(context, SignUpScreen.route),
        label: "Don't have an account?",
        textButton: 'Sign up');
  }
}
