import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';

@JsonSerializable()
class Users {
  int id;
  String username;
  String password;
  String jenis_kelamin;
  String image;
  String email;

  Users({
    required this.id,
    this.password = '',
    required this.username,
    this.image = '',
    required this.jenis_kelamin,
    required this.email,
  });
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
