// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      id: (json['id_user'] as num).toInt(),
      password: json['password'] as String? ?? '',
      username: json['username'] as String,
      image: json['image'] as String? ?? '',
      jenis_kelamin: json['jenis_kelamin'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'id_user': instance.id,
      'username': instance.username,
      'password': instance.password,
      'jenis_kelamin': instance.jenis_kelamin,
      'image': instance.image,
      'email': instance.email,
    };
