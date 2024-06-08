import 'dart:convert';

import 'datum.dart';

class Kelas {
  bool? success;
  String? message;
  List<Datum>? data;

  Kelas({this.success, this.message, this.data});

  factory Kelas.fromMap(Map<String, dynamic> data) => Kelas(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Kelas].
  factory Kelas.fromJson(String data) {
    return Kelas.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Kelas] to a JSON string.
  String toJson() => json.encode(toMap());
}
