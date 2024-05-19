import 'dart:convert';

class Data {
  int? idCource;
  String? nameCource;
  int? price;
  String? level;

  Data({this.idCource, this.nameCource, this.price, this.level});

  factory Data.fromMap(Map<String, dynamic> data) => Data(
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
  /// Parses the string and returns the resulting Json object as [Data].
  factory Data.fromJson(String data) {
    return Data.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
  String toJson() => json.encode(toMap());
}
