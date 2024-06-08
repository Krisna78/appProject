import 'dart:convert';

class Datum {
  String? id;
  String? title;
  String? status;

  Datum({this.id, this.title, this.status});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as String?,
        title: data['title'] as String?,
        status: data['status'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(toMap());
}
