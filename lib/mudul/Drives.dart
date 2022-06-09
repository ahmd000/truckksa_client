import 'Image.dart';
import 'package.dart';

class Drives {
  Drives({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.email,
    required this.password,
    // required this.walletdrive,
    required this.driverProducts,
    required this.time,
    required this.idphotocopydrive,
    required this.driverlicensephoto,
    required this.verificationMobilenumber,
    required this.mobilenumber,
    required this.cases,
    required this.imageId,
    required this.car,
  });

  int id;
  String name;
  double latitude;
  double longitude;
  String email;
  String password;

  // Walletdrive walletdrive;
  List<Product> driverProducts;
  DateTime time;
  Image idphotocopydrive;
  Image driverlicensephoto;
  bool verificationMobilenumber;
  String mobilenumber;
  bool cases;
  Image imageId;
  List<dynamic> car;

  factory Drives.fromJson(Map<String, dynamic> json) => Drives(
        id: json["id"] == null ? 0 : json["id"],
        name: json["name"] == null ? "null" : json["name"],
        latitude: json["latitude"] == null ? 0.0 : json["latitude"],
        longitude: json["longitude"] == null ? 0.0 : json["longitude"],
        email: json["email"] == null ? "null" : json["email"],
        password: json["password"] == null ? "null" : json["password"],
        // walletdrive: json["walletdrive"] == null ? null : Walletdrive.fromJson(json["walletdrive"]),
        driverProducts: json["driverProducts"] == null
            ? []
            : List<Product>.from(
                json["driverProducts"].map((x) => Product.fromJson(x))),
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        idphotocopydrive: Image.fromJson(
            json["idphotocopydrive"] == null ? {} : json["idphotocopydrive"]),
        driverlicensephoto: Image.fromJson(json["driverlicensephoto"] == null
            ? {}
            : json["driverlicensephoto"]),
        verificationMobilenumber: json["verificationMobilenumber"] == null
            ? false
            : json["verificationMobilenumber"],
        mobilenumber:
            json["mobilenumber"] == null ? "" : json["mobilenumber"],
        cases: json["cases"] == null ? false : json["cases"],
        imageId:
            Image.fromJson(json["image_id"] == null ? {} : json["image_id"]),
        car: json["car"] == null
            ? []
            : List<dynamic>.from(json["car"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "email": email == null ? null : email,
        "password": password == null ? null : password,
        // "walletdrive": walletdrive == null ? null : walletdrive.toJson(),
        "driverProducts": driverProducts == null
            ? null
            : List<dynamic>.from(driverProducts.map((x) => x.toJson())),
        "time": time == null ? null : time.toIso8601String(),
        "idphotocopydrive": idphotocopydrive,
        "driverlicensephoto": driverlicensephoto,
        "verificationMobilenumber":
            verificationMobilenumber == null ? null : verificationMobilenumber,
        "mobilenumber": mobilenumber == null ? null : mobilenumber,
        "cases": cases == null ? null : cases,
        "image_id": imageId,
        "car": car == null ? null : List<dynamic>.from(car.map((x) => x)),
      };
}
