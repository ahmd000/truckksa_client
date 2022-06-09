// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:truckksa/mudul/url.dart';

Image imageFromJson(String str) => Image.fromJson(json.decode(str));

String imageToJson(Image data) => json.encode(data.toJson());

class Image {
  Image({
    required this.id,
    required this.time,
    required this.imagePage,
  });

  int id;
  DateTime time;
  String imagePage;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"] == null ? 0 : json["id"],
    time: json["time"] == null ? DateTime.now() : DateTime.parse(json["time"]),
    imagePage: json["imagePage"] == null ? "null" : "$uri"+json["imagePage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "time": time == null ? null : time.toIso8601String(),
    "imagePage": imagePage == null ? null : imagePage,
  };
}
