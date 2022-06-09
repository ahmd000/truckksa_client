// // To parse this JSON data, do
// //
// //     final longin = longinFromJson(jsonString);
//
// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// import 'user.dart';
//
// Halp longinFromJson(String str) => Halp.fromJson(json.decode(str));
//
// String longinToJson(Halp data) => json.encode(data.toJson());
//
// class Halp {
//   Halp({
//     required this.data,
//     required this.status,
//     required this.message,
//   });
//
//   dynamic data;
//   String status;
//   String message;
//
//   factory Halp.fromJson(Map<String, dynamic> json) => Halp(
//     data: user.fromJson(json["data"] == null ? {} : json["data"]),
//     status: json["status"] == null ? null : json["status"],
//     message: json["message"] == null ? null : json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data == null ? null : data.toJson(),
//     "status": status == null ? null : status,
//     "message": message == null ? null : message,
//   };
// }
//
