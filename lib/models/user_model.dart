import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String? id;
  final String? name;
  final String email;

  const UserModel({this.name, required this.email, this.id});

  @override
  List<Object?> get props => [name, email, id];
}
