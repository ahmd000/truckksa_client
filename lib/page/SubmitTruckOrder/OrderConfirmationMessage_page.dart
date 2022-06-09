import 'package:flutter/material.dart';
import 'package:truckksa/help/BoxDecoration.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/fuala.dart';
import 'package:truckksa/page/Home/home.dart';

class OrderonfirmationMssagePage extends StatelessWidget {
  String start_address, end_address;
  double end_latitude,
      end_longitude,
      start_latitude,
      start_longitude,
      latitude,
      longitude;
  int package_id;

  OrderonfirmationMssagePage(
      {required this.start_address,
      required this.end_address,
      required this.end_latitude,
      required this.end_longitude,
      required this.start_latitude,
      required this.start_longitude,
      required this.latitude,
      required this.longitude,
      required this.package_id});

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
                          fuataOrder.CreateOrderProduct(
                            startLocationAddress: start_address,
                            arriveLocationAddress: end_address,
                            arriveLocationLat: end_latitude,
                            arriveLocationLng: end_longitude,
                            startLocationLat: start_latitude,
                            startLocationLng: start_longitude,
                            ordersProducts: [package_id],
                            price: "0",
                            message: msg.text,
                            latitude: latitude,
                            longitude: longitude,
                          );

                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homePage()));
                        },
                        child: Container(
                          width: width,
                          height: height / 18,
                          alignment: Alignment.center,
                          decoration: BtnBluBD,
                          child: Text(lan["Confirmation"], style: Text11),
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
