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

  Datum({this.idCource, this.title, this.price, this.jenis, this.image,this.status,this.deskripsi,this.thumb,this.tingkatan,this.tutorId});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        idCource: data['id'] as String?,
        tutorId: data['tutor_id'] as String?,
        title: data['name_cource'] as String?,
        deskripsi: data["description"] as String?,
        thumb: data['thumb'] as String?,
        price: data['harga'] as int?,
        image: data['image'] as String?,
        status: data['status'] as String?,
        tingkatan: data["tingkatan"] as String?,
        jenis: data['jenis'] as String?,
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
