import 'dart:convert';

import 'package:get/get.dart';
import 'package:truckksa/GetX/GexXUser.dart';
import 'package:truckksa/mudul/Longin.dart';
import 'package:truckksa/mudul/orders.dart';
import 'package:truckksa/mudul/package.dart';
import 'package:truckksa/mudul/paragraphs.dart';
import 'package:truckksa/mudul/url.dart';
import 'package:truckksa/mudul/user.dart';

import 'Section.dart';
import 'package:http/http.dart' as http;

import 'plus_code.dart';

var users = Get.put<GexXUser>(GexXUser());

class fuataCategories {
  static Future<Section> allSection() async {
    Uri url = Uri.parse(urlSection);
    var body = await http.get(url);
    Section data = Section.fromJson({});

    try {
      data = Section.fromJson(jsonDecode(body.body));
    } catch (e) {
      print(e);
    }

    return data;
  }

  static Future<Paragraphs> getdata() async {
    Uri url = Uri.parse(dataparagraphs);
    var request = http.Request('GET', url);

    http.StreamedResponse response = await request.send();
    Paragraphs data = Paragraphs.fromJson({});
    try {
      data = Paragraphs.fromJson(
          jsonDecode(await response.stream.bytesToString()));
      print(data.toJson());
    } catch (e) {
      print(e);
    }

    return data;
  }

// static Future<List<Packages>> packagesbyid(String id) async {
//   Uri url = Uri.parse(GET_PACKAGES + id);
//   var body = await http.get(url);
//   List<Packages> data = [];
//   List lsitdata = [];
//
//   try {
//     lsitdata = jsonDecode(body.body)["data"];
//   } catch (e) {
//     print(e);
//   }
//   for (Map<String, dynamic> json in lsitdata) {
//     try {
//       print(json);
//       data.add(Packages.fromJson(json));
//     } catch (e) {
//       print(e);
//     }
//   }
//   return data;
// }
}

class fuataGooglemap {
  static Future<PlusCode> PlusCodes(double lat, double lng) async {
    Uri url = Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=AIzaSyBS6xtR57ztW4O-9K82IRJaw-sIBKfu-q4");
    var body = await http.get(url);
    PlusCode data = PlusCode.fromJson({});

    try {
      data = PlusCode.fromJson(jsonDecode(body.body));
    } catch (e) {
      print(e);
    }

    return data;
  }
}

class fuatalong {
  static Future<User> longin({
    required String mobile,
    required String password,
    required String latitude,
    required String longitude,
  }) async {
    String link = LOGIN +
        "?" +
        Qwery("mobile", mobile) +
        Qwery("email", mobile) +
        Qwery("password", password) +
        Qwery("latitude", latitude) +
        Qwery("longitude", longitude);
    Uri url = Uri.parse(link);

    var body = await http.get(url);
    print(jsonDecode(body.body));
    print(link);
    users.adddata(User.fromJson(jsonDecode(body.body)));
    return User.fromJson(jsonDecode(body.body));
  }

  static Future<User> Createuser(
      {required String name,
      required String mobilenumber,
      required bool verificationMobilenumber,
      required double latitude,
      required double longitude,
      required String email,
      required String password}) async {
    Uri url = Uri.parse(Create);
    var headers = {'Content-Type': 'application/json'};
    var body = await http.post(url,
        body: json.encode({
          "name": name,
          "mobilenumber": mobilenumber,
          "verificationMobilenumber": verificationMobilenumber,
          "latitude": latitude,
          "longitude": longitude,
          "email": email,
          "password": password
        }),
        headers: headers);
    print(jsonDecode(body.body));
    print(url);
    users.adddata(User.fromJson(jsonDecode(body.body)));
    return users.data;
  }

  static Future<User> changeuser(
      {required String mobilenumber,
      required String password,
      required Map<String, dynamic> data}) async {
    var headers = {'Content-Type': 'application/json'};
    Uri url = Uri.parse(change +
        "?" +
        Qwery("mobile", mobilenumber) +
        Qwery("password", password));

    var body = await http.post(url, headers: headers, body: json.encode(data));
    print(jsonDecode(body.body));
    print(url);
    User s = User.fromJson(jsonDecode(body.body));
    if (s.stest) users.adddata(s);
    return users.data;
  }

  static Future<User> getbyid({
    required int id,
  }) async {
    // Uri url = Uri.parse();

    var body = await GetMapping(byid + "$id");
    // print(jsonDecode(body.body));
    // print(url);
    users.adddata(User.fromJson(body));
    return users.data;
  }
}

class fuataOrder {
  static Future<Orders> CreateOrderProduct(
      {required double startLocationLat,
      required double startLocationLng,
      required String startLocationAddress,
      required double arriveLocationLat,
      required double arriveLocationLng,
      required String arriveLocationAddress,
      required String price,
      bool? type,
      required String message,
      required double latitude,
      required double longitude,
      required List<int> ordersProducts}) async {
    Uri url = Uri.parse(Order);
    var headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {
      "startLocationLat": startLocationLat,
      "startLocationLng": startLocationLng,
      "startLocationAddress": startLocationAddress,
      "arriveLocationLat": arriveLocationLat,
      "arriveLocationLng": arriveLocationLng,
      "arriveLocationAddress": arriveLocationAddress,
      "price": price,
      "acase": "0",
      "type": type == null ? false : true,
      "message": message,
      "customers_id": users.data.data.id,
      "product": ordersProducts,
      "operations": []
    };

    print(data);
    var body = await http.post(url, body: jsonEncode(data), headers: headers);
    print(jsonDecode(body.body));
    print(url);

    return Orders.fromJson({});
  }

  static sendchat({required String message, required String idroom}) {
    PostMapping(chats, {
      "message": message,
      "customersissends": true,
      "customersnon": true,
      "idroom": idroom
    }, headers: {
      'Content-Type': 'application/json'
    });
  }
}

String Qwery(String name, dynamic data) {
  return name + "=" + data.toString() + "&";
}

Future<Map<String, dynamic>> GetMapping(String url) async {
  var request = http.Request('GET', Uri.parse(url));

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return json.decode(await response.stream.bytesToString());
  } else {
    return {};
  }
}

Future<Map<String, dynamic>> PostMapping(String url, Map<String, dynamic> data,
    {dynamic headers}) async {
  // var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse(url));
  request.body = json.encode(data);
  // request.body = json.encode();
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    return json.decode(await response.stream.bytesToString());
  } else {
    return {};
  }
}
