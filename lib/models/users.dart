import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';

@JsonSerializable()
class Users {
  int id;
  String username;
  String password;
  String jenis_kelamin;
  String email;

  Users({
    required this.id,
    this.password = '',
    required this.username,
    required this.jenis_kelamin,
    required this.email,
  });
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
