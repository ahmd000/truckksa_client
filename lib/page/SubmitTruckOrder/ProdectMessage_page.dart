import 'package:flutter/material.dart';
import 'package:truckksa/help/BoxDecoration.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/fuala.dart';
import 'package:truckksa/page/Home/home.dart';

class ProdectMessage_page extends StatelessWidget {
  // String msgt;

  ProdectMessage_page(String msgt) {
    msg.text = msgt;
  }

  TextEditingController msg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: settings.lanDirection,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  right: width / 15,
                  left: width / 15,
                  bottom: height / 3,
                  top: height / 3),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2)),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width - (width / 15) * 2,
                          height: height / 4,
                          child: TextField(
                            minLines: 1,
                            controller: msg,
                            maxLines: 10,
                            decoration: InputDecoration(
                              hintText: lan[
                                  "Writemessageattachedtoapplication(optional)"],
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // fuataOrder.CreateOrderProduct(
                          //   startLocationAddress: start_address,
                          //   arriveLocationAddress: end_address,
                          //   arriveLocationLat: end_latitude,
                          //   arriveLocationLng: end_longitude,
                          //   startLocationLat: start_latitude,
                          //   startLocationLng: start_longitude,
                          //   ordersProducts: [package_id],
                          //   price: "0",
                          //   message:,
                          //   latitude: latitude,
                          //   longitude: longitude,
                          // );

                          Navigator.pop(context, msg.text);
                        },
                        child: Container(
                          width: width,
                          height: height / 18,
                          alignment: Alignment.center,
                          decoration: BtnBluBD,
                          child: Text(lan["Confirmmycomments"], style: Text11),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
