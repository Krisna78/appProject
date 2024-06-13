import 'dart:convert';

class Datum {
  String? id;
  String? title;
  String? description;
  String? video;
  String? thumb;
  String? status;

  Datum({this.id, this.title, this.status, this.description, this.video,this.thumb});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        id: data['id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        video: data['video'] as String?,
        thumb: data['thumb'] as String?,
        status: data['status'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'description': description,
        'video': video,
        'thumb': thumb,
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
