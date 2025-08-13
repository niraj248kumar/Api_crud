import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  String? id;
  String? name;
  String? mob;
  String? price;
  String? discountedPrice;

  ProductModel({
    this.id,
    this.name,
    this.mob,
    this.price,
    this.discountedPrice,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    mob: json["moq"],
    price: json["price"],
    discountedPrice: json["discounted_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "moq": mob,
    "price": price,
    "discounted_price": discountedPrice,
  };
}
