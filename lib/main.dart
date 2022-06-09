import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckksa/GetX/GexXUser.dart';
import 'package:truckksa/page/Registration/Introduction.dart';

import 'GetX/GetXSection.dart';
import 'help/lan.dart';
import 'page/Home/home.dart';
import 'page/Personly/PersonlyPage.dart';
import 'page/SubmitTruckOrder/ChatScreen.dart';

Future<void> main() async {
  lan = lanar;
  lan.addAll({"lang": "ar"});
  WidgetsFlutterBinding.ensureInitialized();
  var gexXUser = Get.put<GexXUser>(GexXUser());
  var getXSection = Get.put<GetXData>(GetXData());
  getXSection.getdata();
  await gexXUser.int();
  var data = await gexXUser.getuser();
  //
  // void d() => print(data.data.id);
  // d();
  runApp(MyApp(data.data.id == 0));
}

class MyApp extends StatelessWidget {
  bool type;

  MyApp(this.type) {
    var gexXUser = Get.put<GexXUser>(GexXUser());
    if (!type) gexXUser.chek(gexXUser.data.data.id);
  }

  // / This widget is the root of your application.
  void d() => print(type);

  @override
  Widget build(BuildContext context) {
    d();

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Cairo-Light"),
      home:
          // ChatScreen()
          // type ? introduction() :
          homePage(),
      // home:personlyPage(),
    );
  }
}

class settings {
  static TextDirection lanDirection = TextDirection.rtl;
}
