import 'package:flutter/material.dart';
import 'package:truckksa/help/BoxDecoration.dart';
import 'package:truckksa/help/Color.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';

import 'CreateAccountPage.dart';
import 'Login.dart';

class introduction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Directionality(
        textDirection: settings.lanDirection,
        child: Scaffold(
            body: Column(
          children: [
            Container(
              width: width,
              height: height / 1.38,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("Asset/image/introductionimage.jpg"))),
            ),
            Container(
              width: width,
              height: height * 0.18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Container(
                        width: width,
                        height: height / 18,
                        alignment: Alignment.center,
                        decoration: inputBD,
                        child: Text(lan["Login"], style: Text1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateAccountPage()));
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
            )
          ],
        )),
      ),
    );
  }
}
