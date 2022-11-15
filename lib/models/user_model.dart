import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  String? name;
  String email;
  String password;

  UserModel({
    this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, email, password];
}
