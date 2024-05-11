import 'dart:convert';

import 'data.dart';

class Siswa {
  bool? success;
  String? message;
  Data? data;

  Siswa({this.success, this.message, this.data});

  factory Siswa.fromMap(Map<String, dynamic> data) => Siswa(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        data: data['data'] == null
            ? null
            : Data.fromMap(data['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Siswa].
  factory Siswa.fromJson(String data) {
    return Siswa.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Siswa] to a JSON string.
  String toJson() => json.encode(toMap());
}
