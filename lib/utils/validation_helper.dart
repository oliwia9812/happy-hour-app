import 'package:happy_hour_app/screens/authentication/validation.dart';

class ValidationHelper {
  static bool getValidation(
    String? value,
    String textFieldName,
  ) {
    switch (textFieldName) {
      case "Name":
        return value!.isNameValid();
      case "Email":
        return value!.isEmailValid();
      case "Password":
        return value!.isPasswordValid();
      default:
        return false;
    }
  }
}
