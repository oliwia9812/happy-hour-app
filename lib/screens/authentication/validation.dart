extension ValidationString on String {
  bool isNameValid() {
    final nameRegEx = RegExp('[a-zA-Z]');
    return !nameRegEx.hasMatch(this);
  }

  bool isEmailValid() {
    final emailRegEx = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return !emailRegEx.hasMatch(this);
  }

  bool isPasswordValid() {
    final passwordRegEx =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return !passwordRegEx.hasMatch(this);
  }
}
