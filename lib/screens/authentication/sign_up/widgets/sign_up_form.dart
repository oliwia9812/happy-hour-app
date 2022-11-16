import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/screens/authentication/form_values.dart';
import 'package:happy_hour_app/screens/authentication/sign_in/sign_in_screen.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/cubit/sign_up_cubit.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_toggle.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_label.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_text_field.dart';
import 'package:happy_hour_app/screens/home/home_screen.dart';
import 'package:happy_hour_app/styles/app_colors.dart';
import 'package:happy_hour_app/utils/validation_helper.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final Map<String, dynamic> _user = {};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _loading = false;

  final List<FormValues> _formValues = [
    FormValues(
        hintText: "John",
        textFieldName: "Name",
        errorValidationMessage: "Please enter correct name"),
    FormValues(
        hintText: "JohnDoe@example.com",
        textFieldName: "Email",
        errorValidationMessage: "Please enter correct email address"),
    FormValues(
        hintText: "********",
        textFieldName: "Password",
        errorValidationMessage:
            "Your password must be have at least 1 uppercase & 1 lowercase character, 1 number and 8 characters long"),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          setState(() {
            _loading = true;
          });
        }
        if (state is SignUpFailure) {
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
        if (state is SignUpSuccess) {
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
              _buildSignUpButton(context),
              _buildToggleToSignIn(context),
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
            isPassword: _formValues[index] == _formValues.last,
            hintText: hintText,
            validator: (value) => (value!.isEmpty)
                ? "Enter Your ${_formValues[index].textFieldName}"
                : (value.length < 3 ||
                        ValidationHelper.getValidation(value, textFieldName))
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

  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: CustomButton(
        buttonTitle: "Sign up",
        loading: _loading,
        callback: () {
          if (_formKey.currentState!.validate()) {
            context.read<SignUpCubit>().signUp(
                  name: _user["Name"],
                  email: _user["Email"],
                  password: _user["Password"],
                );
          }
        },
      ),
    );
  }

  Widget _buildToggleToSignIn(BuildContext context) {
    return AuthToggle(
        callback: () => Navigator.pushNamed(context, SignInScreen.route),
        label: "Already have an account?",
        textButton: "Sign in");
  }
}
