import 'dart:convert';

List<HomeCategorias> homeCategoriasFromJson(String str) =>
    List<HomeCategorias>.from(
        json.decode(str).map((x) => HomeCategorias.fromJson(x)));

String homeCategoriasToJson(List<HomeCategorias> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeCategorias {
  HomeCategorias({
    this.id,
    this.name,
    this.picture,
  });

  String id;
  String name;
  String picture;

  factory HomeCategorias.fromJson(Map<String, dynamic> json) => HomeCategorias(
        id: json["Id"],
        name: json["Name"],
        picture: json["Picture"],
      );

  Map<String, dynamic> toJson() => {
        "Id": id,
        "Name": name,
        "Picture": picture,
      };
}
