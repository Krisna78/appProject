import 'dart:convert';
class Datum {
  String? idCource;
  String? tutorId;
  String? title;
  String? deskripsi;
  String? thumb;
  String? status;
  String? image;
  int? price;
  String? tingkatan;
  String? jenis;
  Tutor? tutor;

  Datum({this.idCource, this.title, this.price, this.jenis, this.image,this.status,this.deskripsi,this.thumb,this.tingkatan,this.tutorId, this.tutor});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        idCource: data['id'] as String?,
        tutorId: data['tutor_id'] as String?,
        title: data['title'] as String?,
        deskripsi: data["description"] as String?,
        thumb: data['thumb'] as String?,
        price: data['harga'] as int?,
        image: data['image'] as String?,
        status: data['status'] as String?,
        tingkatan: data["tingkatan"] as String?,
        jenis: data['jenis'] as String?,
        tutor: data['tutor'] != null ? Tutor.fromMap(data['tutor']) : null,
      );

  Map<String, dynamic> toMap() => {
        'id': idCource,
        'title': title,
        'tutor_id' : tutorId,
        'description' : deskripsi,
        'thumb' : thumb,
        'harga': price,
        'image': image,
        'status' : status,
        'tingkatan' : tingkatan,
        'jenis': jenis,
        'tutor': tutor?.toMap(),
      };

  factory Datum.fromJson(String data) {
    return Datum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

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
