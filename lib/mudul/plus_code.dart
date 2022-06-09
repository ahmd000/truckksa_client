// To parse this JSON data, do
//
//     final plusCode = plusCodeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlusCode plusCodeFromJson(String str) => PlusCode.fromJson(json.decode(str));

String plusCodeToJson(PlusCode data) => json.encode(data.toJson());

class PlusCode {
  PlusCode({
    required this.plusCode,
  });

  PlusCodeClass plusCode;

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
    plusCode:  PlusCodeClass.fromJson(json["plus_code"] == null ? {} :json["plus_code"]),
  );

  Map<String, dynamic> toJson() => {
    "plus_code": plusCode == null ? null : plusCode.toJson(),
  };
}

class PlusCodeClass {
  PlusCodeClass({
    required this.compoundCode,
    required this.globalCode,
  });

  String compoundCode;
  String globalCode;

  factory PlusCodeClass.fromJson(Map<String, dynamic> json) => PlusCodeClass(
    compoundCode: json["compound_code"] == null ? "" : json["compound_code"],
    globalCode: json["global_code"] == null ? "null" : json["global_code"],
  );

  Map<String, dynamic> toJson() => {
    "compound_code": compoundCode == null ? null : compoundCode,
    "global_code": globalCode == null ? null : globalCode,
  };
}
