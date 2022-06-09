import 'Image.dart';
import 'orders.dart' as OrdersFile;

class User {
  User({
    required this.stest,
    required this.data,
    required this.mesg,
  });

  bool stest;
  Data data;
  String mesg;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.customersimage,
    required this.walletcustomers,
    required this.email,
    required this.password,
    required this.customers,
    required this.time,
    required this.mobilenumber,
    required this.verificationMobilenumber,
  });

  int id;
  String name;
  double latitude;
  double longitude;
  Image customersimage;
  dynamic walletcustomers;
  String email;
  String password;
  List<OrdersFile.Data> customers;
  DateTime time;
  String mobilenumber;
  bool verificationMobilenumber;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "null" : json["name"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"].toDouble(),
        longitude:
            json["longitude"] == null ? 0.0 : json["longitude"].toDouble(),
        customersimage: Image.fromJson(
            json["customersimage"] == null ? {} : json["customersimage"]),
        walletcustomers: json["walletcustomers"],
        email: json["email"] == null ? "null" : json["email"],
        password: json["password"] == null ? "null" : json["password"],
        customers: json["customers"] == null
            ? []
            : List<OrdersFile.Data>.from(
                json["customers"].map((x) => OrdersFile.Data.fromJson(x))),
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        mobilenumber:
            json["mobilenumber"] == null ? "null" : json["mobilenumber"],
        verificationMobilenumber: json["verificationMobilenumber"] == null
            ? false
            : json["verificationMobilenumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "customersimage": customersimage,
        "walletcustomers": walletcustomers,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        "customers": customers == null
            ? null
            : List<dynamic>.from(customers.map((x) => x.toJson())),
        "time": time == null ? null : time.toIso8601String(),
        "mobilenumber": mobilenumber == null ? null : mobilenumber,
        "verificationMobilenumber":
            verificationMobilenumber == null ? null : verificationMobilenumber,
      };
}
