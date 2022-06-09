// To parse this JSON data, do
//
//     final section = sectionFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:truckksa/mudul/package.dart';

import 'Image.dart';

Section sectionFromJson(String str) => Section.fromJson(json.decode(str));

String sectionToJson(Section data) => json.encode(data.toJson());

class Section {
  Section({
    required this.stest,
    required this.data,
    required this.mesg,
  });

  bool stest;
  List<SectionClass> data;
  String mesg;

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        stest: json["stest"] == null ? false : json["stest"],
        data: json["data"] == null
            ? []
            : List<SectionClass>.from(
                json["data"].map((x) => SectionClass.fromJson(x))),
        mesg: json["mesg"] == null ? "null" : json["mesg"],
      );

  Map<String, dynamic> toJson() => {
        "stest": stest == null ? null : stest,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "mesg": mesg == null ? null : mesg,
      };
}

class SectionClass {
  SectionClass({
    required this.id,
    required this.name,
    required this.price,
    required this.time,
    required this.product,
    required this.sectionimage,
    required this.minimumPrice,
    required this.maximumPrice,
  });

  int id;
  String name;
  String price;
  DateTime time;
  List<Product> product;
  Image sectionimage;
  String minimumPrice;
  String maximumPrice;

  factory SectionClass.fromJson(Map<String, dynamic> json) => SectionClass(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "null" : json["name"],
        price: json["price"] == null ? "null" : json["price"],
    minimumPrice: json["minimumPrice"] == null ? "null" : json["minimumPrice"],
    maximumPrice: json["maximumPrice"] == null ? "null" : json["maximumPrice"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),

        product: json["product"] == null
            ? []
            : List<Product>.from(
                json["product"].map((x) => Product.fromJson(x))),
        sectionimage: Image.fromJson(
            json["sectionimage"] == null ? {} : json["sectionimage"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "price": price == null ? null : price,
        "time": time == null ? null : time.toIso8601String(),
        "product":
            product == null ? null : List<dynamic>.from(product.map((x) => x)),
        "sectionimage": sectionimage,
      };
}
