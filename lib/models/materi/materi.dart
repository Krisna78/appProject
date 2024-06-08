import 'dart:convert';

import 'datum.dart';

class Materi {
  bool? success;
  String? message;
  List<Datum>? data;

  Materi({this.success, this.message, this.data});

  factory Materi.fromMap(Map<String, dynamic> data) => Materi(
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
  /// Parses the string and returns the resulting Json object as [Materi].
  factory Materi.fromJson(String data) {
    return Materi.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Materi] to a JSON string.
  String toJson() => json.encode(toMap());
}
