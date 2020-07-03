import 'dart:convert';

List<ProductsModel> productsModelFromJson(String str) =>
    List<ProductsModel>.from(
        json.decode(str).map((x) => ProductsModel.fromJson(x)));

String productsModelToJson(List<ProductsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsModel {
  ProductsModel({
    this.id,
    this.name,
    this.sku,
    this.stockquantity,
    this.price,
    this.oldprice,
    this.picture,
  });

  String id;
  String name;
  String sku;
  String stockquantity;
  String price;
  String oldprice;
  String picture;

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        id: json["id"],
        name: json["Name"],
        sku: json["sku"],
        stockquantity: json["stockquantity"],
        price: json["price"],
        oldprice: json["oldprice"],
        picture: json["Picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Name": name,
        "sku": sku,
        "stockquantity": stockquantity,
        "price": price,
        "oldprice": oldprice,
        "Picture": picture,
      };
}
