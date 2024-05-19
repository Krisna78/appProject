import 'dart:convert';

import 'data.dart';

class ProfileSiswa {
  bool? success;
  String? message;
  Data? data;

  ProfileSiswa({this.success, this.message, this.data});

  factory ProfileSiswa.fromMap(Map<String, dynamic> data) => ProfileSiswa(
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
  /// Parses the string and returns the resulting Json object as [ProfileSiswa].
  factory ProfileSiswa.fromJson(String data) {
    return ProfileSiswa.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProfileSiswa] to a JSON string.
  String toJson() => json.encode(toMap());
}
