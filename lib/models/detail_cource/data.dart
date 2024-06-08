import 'dart:convert';

class Data {
  String? idCource;
  String? title;
  String? tutorId;
  String? deskripsi;
  String? thumb;
  String? status;
  String? image;
  int? price;
  String? tingkatan;
  String? jenis;
  Tutor? tutor;

  Data(
      {this.idCource,
      this.deskripsi,
      this.jenis,
      this.status,
      this.thumb,
      this.tutorId,
      this.title,
      this.price,
      this.tingkatan,
      this.image,
      this.tutor});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
        idCource: data['id'] as String?,
        title: data['title'] as String?,
        tutorId: data['tutor_id'] as String?,
        deskripsi: data['description'] as String?,
        thumb: data["thumb"] as String?,
        price: data['harga'] as int?,
        image: data['image'] as String?,
        jenis: data['jenis'] as String?,
        tingkatan: data['tingkatan'] as String?,
        tutor: data['tutor'] != null ? Tutor.fromMap(data['tutor']) : null,
      );

  Map<String, dynamic> toMap() => {
        'id': idCource,
        'title': title,
        'tutor_id': tutorId,
        'description': deskripsi,
        'thumb': thumb,
        'jenis': jenis,
        'harga': price,
        'image': image,
        'tingkatan': tingkatan,
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

class Tutor {
  String? id;
  String? name;
  String? profession;
  String? email;
  String? image;

  Tutor({this.id, this.name, this.profession, this.email, this.image});

  factory Tutor.fromMap(Map<String, dynamic> data) => Tutor(
        id: data['id'] as String?,
        name: data['name'] as String?,
        profession: data['profession'] as String?,
        email: data['email'] as String?,
        image: data['image'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'profession': profession,
        'email': email,
        'image': image,
      };

  factory Tutor.fromJson(String data) {
    return Tutor.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toMap());
}
