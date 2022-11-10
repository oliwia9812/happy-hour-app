class UserModel {
  String? name;
  String email;
  String password;

  UserModel({
    this.name,
    required this.email,
    required this.password,
  });
}
