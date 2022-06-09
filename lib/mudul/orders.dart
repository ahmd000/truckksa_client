import 'package:truckksa/mudul/Rooms.dart';

import 'package.dart';

class Orders {
  Orders({
    required this.stest,
    required this.data,
    required this.mesg,
  });

  bool stest;
  Data data;
  String mesg;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        stest: json["stest"] == null ? false : json["stest"],
        data: Data.fromJson(json["data"] == null ? {} : json["data"]),
        mesg: json["mesg"] == null ? "null" : json["mesg"],
      );

  Map<String, dynamic> toJson() => {
        "stest": stest == null ? null : stest,
        "data": data == null ? null : data.toJson(),
        "mesg": mesg == null ? null : mesg,
      };
}

class Data {
  Data({
    required this.id,
    required this.startLocationLat,
    required this.startLocationLng,
    required this.startLocationAddress,
    required this.arriveLocationLat,
    required this.arriveLocationLng,
    required this.arriveLocationAddress,
    required this.price,
    required this.rooms,
    required this.ordersProducts,
    required this.ordersOperations,
    required this.acase,
    required this.time,
  });

  int id;
  double startLocationLat;
  double startLocationLng;
  String startLocationAddress;
  double arriveLocationLat;
  double arriveLocationLng;
  String arriveLocationAddress;
  String price;
  List<Product> ordersProducts;
  List<dynamic> ordersOperations;
  String acase;
  DateTime time;
  List<Rooms> rooms;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        startLocationLat: json["startLocationLat"] == null
            ? 0.0
            : json["startLocationLat"].toDouble(),
        startLocationLng: json["startLocationLng"] == null
            ? 0.0
            : json["startLocationLng"].toDouble(),
        startLocationAddress: json["startLocationAddress"] == null
            ? "null"
            : json["startLocationAddress"],
        arriveLocationLat: json["arriveLocationLat"] == null
            ? 0.0
            : json["arriveLocationLat"].toDouble(),
        arriveLocationLng: json["arriveLocationLng"] == null
            ? 0.0
            : json["arriveLocationLng"].toDouble(),
        arriveLocationAddress: json["arriveLocationAddress"] == null
            ? "null"
            : json["arriveLocationAddress"],
        price: json["price"] == null ? "null" : json["price"],
        acase: json["acase"] == null ? "null" : json["acase"],
        ordersProducts: json["ordersProducts"] == null
            ? []
            : List<Product>.from(
                json["ordersProducts"].map((x) => Product.fromJson(x))),
        ordersOperations: json["operations"] == null
            ? []
            : List<dynamic>.from(json["operations"].map((x) => x)),
        rooms: json["rooms"] == null
            ? []
            : List<Rooms>.from(json["rooms"].map((x) => Rooms.fromJson(x))),
        id: json["id"] == null ? 0 : json["id"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "startLocationLat": startLocationLat == null ? null : startLocationLat,
        "startLocationLng": startLocationLng == null ? null : startLocationLng,
        "startLocationAddress":
            startLocationAddress == null ? null : startLocationAddress,
        "arriveLocationLat":
            arriveLocationLat == null ? null : arriveLocationLat,
        "arriveLocationLng":
            arriveLocationLng == null ? null : arriveLocationLng,
        "arriveLocationAddress":
            arriveLocationAddress == null ? null : arriveLocationAddress,
        // "price": price == null ? null : price,
        // "ordersProducts": ordersProducts == null
        //     ? null
        //     : List<dynamic>.from(ordersProducts.map((x) => x)),
        // "ordersOperations": ordersOperations == null
        //     ? null
        //     : List<dynamic>.from(ordersOperations.map((x) => x)),
        "acase": acase == null ? null : acase,
        "time": time == null ? null : time.toIso8601String(),
      };
}
