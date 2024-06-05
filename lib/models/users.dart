import 'package:json_annotation/json_annotation.dart';
part 'users.g.dart';

@JsonSerializable()
class Users {
  String id;
  String name;
  String password;
  String image;
  String email;

  Users({
    required this.id,
    this.password = '',
    required this.name,
    this.image = '',
    required this.email,
  });
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}
