import 'dart:convert';

class Datum {
  int? idCource;
  String? nameCource;
  int? price;
  String? level;

  Datum({this.idCource, this.nameCource, this.price, this.level});

  factory Datum.fromMap(Map<String, dynamic> data) => Datum(
        idCource: data['id_cource'] as int?,
        nameCource: data['name_cource'] as String?,
        price: data['price'] as int?,
        level: data['level'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id_cource': idCource,
        'name_cource': nameCource,
        'price': price,
        'level': level,
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
