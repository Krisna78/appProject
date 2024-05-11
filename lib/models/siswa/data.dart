import 'dart:convert';

import 'siswa.dart';

class Data {
  int? idUser;
  String? username;
  String? email;
  String? jenisKelamin;
  Siswa? siswa;

  Data({
    this.idUser,
    this.username,
    this.email,
    this.jenisKelamin,
    this.siswa,
  });

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        idUser: data['id_user'] as int?,
        username: data['username'] as String?,
        email: data['email'] as String?,
        jenisKelamin: data['jenis_kelamin'] as String?,
        siswa: data['siswa'] == null
            ? null
            : Siswa.fromMap(data['siswa'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id_user': idUser,
        'username': username,
        'email': email,
        'jenis_kelamin': jenisKelamin,
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
