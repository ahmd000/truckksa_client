// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'Image.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.id,
    required this.product,
  });

  int id;
  ProductClass product;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? 0 : json["id"],
        product: ProductClass.fromJson(
            json["product"] == null ? {} : json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "product": product == null ? null : product.toJson(),
      };
}

class ProductClass {
  ProductClass({
    required this.id,
    required this.names,
    required this.price,
    required this.time,
    required this.imageProduct,
  });

  int id;
  String names;
  String price;
  DateTime time;
  Image imageProduct;

  factory ProductClass.fromJson(Map<String, dynamic> json) => ProductClass(
        id: json["id"] == null ? 0 : json["id"],
        names: json["names"] == null ? "null" : json["names"],
        price: json["price"] == null ? "null" : json["price"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        imageProduct: Image.fromJson(
            json["imageProduct"] == null ? {} : json["imageProduct"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "names": names == null ? null : names,
        "price": price == null ? null : price,
        "time": time == null ? null : time.toIso8601String(),
        "imageProduct": imageProduct,
      };
}
