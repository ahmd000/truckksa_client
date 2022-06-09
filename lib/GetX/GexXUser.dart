import 'dart:convert';
import 'dart:core' as i;
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:truckksa/mudul/fuala.dart';
import 'package:truckksa/mudul/orders.dart' as ord;
import 'package:truckksa/mudul/user.dart';

class GexXUser extends GetxController {
  SharedPreferences? _sharedPreferencesuser;
  bool lood = true;

  @override
  void onInit() {}

  Future<void> int() async {
    _sharedPreferencesuser = await SharedPreferences.getInstance();
  }

  void chek(i.int id) async {
    lood = true;
    do {
      fuatalong.getbyid(id: id);

      update();
      await Future.delayed(Duration(seconds: 1));
    } while (lood);
  }

  User data = User.fromJson({});

  i.Future<void> longuot() async {
    lood = false;
    _sharedPreferencesuser!.clear();
    await Future.delayed(Duration(seconds: 1));

    data = User.fromJson({});
    update();
  }

  User adddata(User d) {
    _sharedPreferencesuser!.setString("user", jsonEncode(d.toJson()));
    data = d;
    // print("_sharedPreferencesuser");
    update();
    return data;
  }

  Future<User> getuser() async {
    try {
      data = User.fromJson(
          jsonDecode((await _sharedPreferencesuser!.getString("user")!)));
      // chek(data.data.id);
    } catch (e) {
      data = User.fromJson({});
      print(e);
    }
    update();
    return data;
  }
}
