import 'dart:convert';

import 'siswa.dart';

class Data {
  int? idUser;
  String? name;
  String? email;
  String? image;
  Siswa? siswa;

  Data({
    this.idUser,
    this.name,
    this.email,
    this.image,
    this.siswa,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        idUser: data['id_user'] as int?,
        name: data['name'] as String?,
        image: data['image'] as String?,
        email: data['email'] as String?,
        siswa: data['siswa'] == null
            ? null
            : Siswa.fromMap(data['siswa'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id_user': idUser,
        'name': name,
        'image': image,
        'email': email,
        'siswa': siswa?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
