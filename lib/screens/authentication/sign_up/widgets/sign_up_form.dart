import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_hour_app/constants.dart';
import 'package:happy_hour_app/models/user.dart';
import 'package:happy_hour_app/screens/authentication/form_values.dart';
import 'package:happy_hour_app/screens/authentication/sign_up/sign_up_bloc.dart';
import 'package:happy_hour_app/screens/authentication/widgets/auth_toggle.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_button.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_label.dart';
import 'package:happy_hour_app/screens/common_widgets/custom_text_field.dart';
import 'package:go_router/go_router.dart';
import 'package:happy_hour_app/utils/validation_helper.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});

  static List<FormValues> formValues = [
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

  final Map<String, dynamic> user = {};

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            isPassword: formValues[index] == formValues.last,
            hintText: hintText,
            validator: (value) => (value!.isEmpty)
                ? "Enter Your ${formValues[index].textFieldName}"
                : (value.length < 3 ||
                        ValidationHelper.getValidation(value, textFieldName))
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

  Widget _buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: CustomButton(
        buttonTitle: "Sign up",
        callback: () {
          if (_formKey.currentState!.validate()) {
            UserModel userModel = UserModel(
              name: user["Name"],
              email: user["Email"],
              password: user["Password"],
            );

            BlocProvider.of<SignUpBloc>(context).add(
              SignUpWithEmailAndPassword(user: userModel),
            );
          }
        },
      ),
    );
  }

  Widget _buildToggleToSignIn(BuildContext context) {
    return AuthToggle(
        callback: () => context.go(Constants.signInRouteName),
        label: "Already have an account?",
        textButton: "Sign in");
  }
}
