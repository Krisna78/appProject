import 'dart:convert';

import 'data.dart';

class DetailCource {
  bool? success;
  String? message;
  Data? data;

  DetailCource({this.success, this.message, this.data});

  factory DetailCource.fromMap(Map<String, dynamic> data) => DetailCource(
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
  /// Parses the string and returns the resulting Json object as [DetailCource].
  factory DetailCource.fromJson(String data) {
    return DetailCource.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DetailCource] to a JSON string.
  String toJson() => json.encode(toMap());
}
