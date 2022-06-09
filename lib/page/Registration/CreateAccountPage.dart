import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckksa/GetX/GexXUser.dart';
import 'package:truckksa/help/BoxDecoration.dart';
import 'package:truckksa/help/Color.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/GetFmcTokn.dart';
import 'package:truckksa/mudul/Longin.dart';
import 'package:truckksa/mudul/fuala.dart';
import 'package:truckksa/mudul/user.dart';
import 'package:truckksa/page/Home/home.dart';

class CreateAccountPage extends StatelessWidget {
  TextEditingController controllerpassword = TextEditingController();

  TextEditingController controllerphone = TextEditingController();
  TextEditingController controllername = TextEditingController();

  TextEditingController controllerEmail = TextEditingController();
  var GetXUser = Get.put<GexXUser>(GexXUser());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Directionality(
            textDirection: settings.lanDirection,
            child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Container(
                    height: height / 1.1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: width,
                              height: height * 0.25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "Asset/image/Stylebec.jpeg"))),
                            ),
                            Text(
                              lan["CreateAccount"],
                              style: Text2,
                            ),
                            SizedBox(
                              height: height / 60,
                            ),
                            Text(
                              lan["Pleaseenteraccountinformationcorrect"],
                              style: Text0,
                            ),
                            SizedBox(
                              height: height / 14,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  width: width,
                                  height: height / 17,
                                  alignment: Alignment.center,
                                  decoration: inputBD,
                                  child: TextField(
                                    controller: controllername,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: lan["name"],
                                      helperStyle:
                                          Text1.copyWith(color: Colors.black38),
                                      border: InputBorder.none,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  width: width,
                                  height: height / 17,
                                  alignment: Alignment.center,
                                  decoration: inputBD,
                                  child: TextField(
                                    controller: controllerEmail,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: lan["E-mail"],
                                      helperStyle:
                                          Text1.copyWith(color: Colors.black38),
                                      border: InputBorder.none,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  width: width,
                                  height: height / 17,
                                  alignment: Alignment.center,
                                  decoration: inputBD,
                                  child: TextField(
                                    controller: controllerphone,
                                    textAlign: TextAlign.center,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: lan["phone"],
                                      helperStyle:
                                          Text1.copyWith(color: Colors.black38),
                                      border: InputBorder.none,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  width: width,
                                  height: height / 17,
                                  alignment: Alignment.center,
                                  decoration: inputBD,
                                  child: TextField(
                                    controller: controllerpassword,
                                    textAlign: TextAlign.center,
                                    // keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      hintText: lan["password"],
                                      helperStyle:
                                          Text1.copyWith(color: Colors.black38),
                                      border: InputBorder.none,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                        Column(
                          children: [],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () async {
                              if (controllerpassword.text.isEmpty ||
                                  controllerphone.text.isEmpty ||
                                  controllerEmail.text.isEmpty ||
                                  controllername.text.isEmpty) {
                                Get.defaultDialog(
                                    title: "",
                                    middleText:
                                        lan["IncorrectLoginInformation"]);

                                return;
                              }
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    Future<void> muthod() async {
                                      User date = (await fuatalong.Createuser(
                                          longitude: 0,
                                          latitude: 0,
                                          email: controllerEmail.text,
                                          mobilenumber: controllerphone.text,
                                          name: controllername.text,
                                          verificationMobilenumber: false,
                                          // fcm_token: (await tokn.Gettoken())!,
                                          password: controllerpassword.text));
                                      if (!date.stest) {
                                        Navigator.pop(context);
                                        Get.defaultDialog(
                                            title: lan[
                                                "IncorrectLoginInformation"],
                                            middleText: date.mesg);
                                        return;
                                      }
                                      GetXUser.chek(date.data.id);
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  homePage()));
                                    }

                                    muthod();
                                    return WillPopScope(
                                      onWillPop: () async {
                                        debugPrint("Will pop");
                                        return false;
                                      },
                                      child: Center(
                                          child: CircularProgressIndicator()),
                                    );
                                  });
                            },
                            child: Container(
                              width: width,
                              height: height / 18,
                              alignment: Alignment.center,
                              decoration: BtnBluBD,
                              child: Text(lan["CreateAccount"], style: Text11),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
