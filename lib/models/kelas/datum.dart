import 'dart:convert';

class Datum {
  String? playlistId;
  String? playlistTitle;

  Datum({this.playlistId, this.playlistTitle});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        playlistId: data['playlist_id'] as String?,
        playlistTitle: data['playlist_title'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'playlist_id': playlistId,
        'playlist_title': playlistTitle,
      };

  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }
  String toJson() => json.encode(toMap());
}
