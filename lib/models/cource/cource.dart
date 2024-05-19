import 'dart:convert';

import 'datum.dart';

class Cource {
  bool? success;
  String? message;
  List<Datum>? data;
  Cource({this.success, this.message, this.data});

  factory Cource.fromMap(Map<String, dynamic> data) => Cource(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromMap(e as Map<String, dynamic>))
            .toList(),
        // data: data['data'] == null ? null : Datum.fromMap(data['data'] as Map<String,dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'success': success,
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cource].
  factory Cource.fromJson(String data) {
    return Cource.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cource] to a JSON string.
  String toJson() => json.encode(toMap());
}
