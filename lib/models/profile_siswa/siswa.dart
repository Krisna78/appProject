import 'dart:convert';

class Siswa {
  int? idSiswa;
  String? namaLengkap;
  String? noTelp;
  String? alamat;

  Siswa({this.idSiswa, this.noTelp, this.alamat, this.namaLengkap});

  factory Siswa.fromMap(Map<String, dynamic> data) => Siswa(
        idSiswa: data['id_siswa'] as int?,
        namaLengkap: data['nama_lengkap'] as String?,
        noTelp: data['no_telp'] as String?,
        alamat: data['alamat'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id_siswa': idSiswa,
        'nama_lengkap': namaLengkap,
        'no_telp': noTelp,
        'alamat': alamat,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Siswa].
  factory Siswa.fromJson(String data) {
    return Siswa.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Siswa] to a JSON string.
  String toJson() => json.encode(toMap());
}
