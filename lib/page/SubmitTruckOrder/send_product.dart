import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../GetX/GexXUser.dart';
import '../../help/Color.dart';
import '../../help/TextStyle.dart';
import '../../help/lan.dart';
import '../../mudul/fuala.dart';
import '../Record/Record_Page.dart';
import 'GetLocationPage.dart';
import 'Preachatyourcommandoh.dart';
import 'ProdectMessage_page.dart';

class send_products extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<send_products> {
  var gexXUser = Get.put<GexXUser>(GexXUser());

  String start_address = "", end_address = "", msg = "";

  double end_latitude = 0.0,
      end_longitude = 0.0,
      start_latitude = 0.0,
      start_longitude = 0.0;

  @override
  Widget build(BuildContext context) {
    return caht_product(context);
  }

  bool sned = false;
  bool ismap = false;

  Widget caht_product(context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 400),
                        opacity: sned ? 1.0 : 0.0,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              sned = false;
                              print(sned);
                              ismap = false;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  lan["tryagain"],
                                  style: TextStyle(
                                      color: homeColor,
                                      fontFamily: "TajawalMedium"),
                                ),
                                Icon(
                                  Icons.loop_outlined,
                                  color: homeColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Spacer(),
                      masseg_style(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            " ${gexXUser.data.data.name} " + lan["welcome"],
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "TajawalMedium"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      masseg_style(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Column(
                            children: [
                              Text(
                                lan["HowcanIserveyoutoday"],
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontFamily: "TajawalMedium"),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Container(
                                  color: Colors.black26,
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 0.5,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    sned = true;
                                    print(sned);
                                  });
                                },
                                child: Text(
                                  lan["parceldelivery"],
                                  style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontFamily: "TajawalMedium"),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Container(
                                  color: Colors.black26,
                                  width: MediaQuery.of(context).size.width / 2,
                                  height: 0.5,
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  Navigator.push(context,  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        recordPage(),
                                  ), );
                                },
                                child: Text(
                                  lan["reviewmyrequests"],
                                  style: TextStyle(
                                      color: Colors.blue.shade700,
                                      fontFamily: "TajawalMedium"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 400),
                  opacity: sned ? 1.0 : 0.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        masseg_style(
                          color: homeColor,
                          borderRadius: BorderRadius.circular(20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              lan["parceldelivery"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "TajawalMedium"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    if (await Preachatyourcommand() == null) return;
                    setState(() {
                      ismap = true;
                      print(sned);
                    });
                  },
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: 800),
                    opacity: sned ? 1.0 : 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          masseg_style(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      lan["Preachatyourcommandoh"] +
                                          " " +
                                          gexXUser.data.data.name +
                                          " ... " +
                                          "\n" +
                                          lan["Canyouspecifythesendingandreceivinglocationsforus"],
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontFamily: "TajawalMedium"),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, bottom: 8),
                                    child: Container(
                                      color: Colors.black26,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 0.5,
                                    ),
                                  ),
                                  Text(
                                    lan["Sharelocation"],
                                    style: TextStyle(
                                        color: Colors.blue.shade700,
                                        fontFamily: "TajawalMedium"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var nodes = await showDialog(
                        builder: (context) {
                          return ProdectMessage_page(msg);
                        },
                        context: context);
                    if (nodes == null) return;
                    msg = (nodes as String);
                  },
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: ismap ? 600 : 800),
                    opacity: ismap ? 1.0 : 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          masseg_style(
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, top: 8, right: 15, left: 8),
                              child: Text(
                                lan["Writeyournotes"],
                                style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontFamily: "TajawalMedium"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await fuataOrder.CreateOrderProduct(
                      startLocationAddress: start_address,
                      arriveLocationAddress: end_address,
                      arriveLocationLat: end_latitude,
                      arriveLocationLng: end_longitude,
                      startLocationLat: start_latitude,
                      startLocationLng: start_longitude,
                      ordersProducts: [],
                      price: "0",
                      type: true,
                      message: msg,
                      latitude: 0,
                      longitude: 0,
                    );
                    Sendtheorder();
                  },
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: ismap ? 800 : 1000),
                    opacity: ismap ? 1.0 : 0.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          masseg_style(
                            borderRadius: BorderRadius.circular(20),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 8, top: 8, right: 15, left: 8),
                              child: Text(
                                lan["Sendtheorder"],
                                style: TextStyle(
                                    color: Colors.blue.shade700,
                                    fontFamily: "TajawalMedium"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void Sendtheorder() {
    showDialog(
        context: context,
        builder: (context) {
          double widthPadding = MediaQuery.of(context).size.width / 7;
          double heightPadding = MediaQuery.of(context).size.height / 3;

          return Padding(
            padding: EdgeInsets.only(
                left: widthPadding,
                right: widthPadding,
                bottom: heightPadding,
                top: heightPadding),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 10)),
              child: Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      lan["YourorderhasbeencompletedIfyouwouldliketoreviewtheorderdetailsseetheorderspage"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: "TajawalMedium"),
                    ),
                    // Spacer(),
                    Image.asset("Asset/image/successfully.png",
                        height: heightPadding / 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () async {
                            // Navigator.pop(context);
                            // await Future.delayed(Duration(microseconds: 300));
                            Navigator.push(context,  MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  recordPage(),
                            ), );
                            // Navigator.pushAndRemoveUntil(
                            //     context,
                            //
                            //     this);
                          },
                          child: Text(
                            lan["reviewmyrequests"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: homeColor,
                                fontFamily: "TajawalMedium"),
                          ),
                        ),
                      ],
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Map<String, dynamic> data = {};

  Future<dynamic> Preachatyourcommand() async {
    var t = await showDialog(
        builder: (context) {
          return Preachatyourcommandoh(
            data: data,
          );
        },
        context: context);

    if (t == null) return t;
    data = t as Map<String, dynamic>;
    start_address = data["ti1"];
    end_address = data["ti2"];
    LatLng st = data["position1"];
    start_latitude = st.latitude;
    start_longitude = st.longitude;
    LatLng end = data["position2"];
    end_latitude = end.latitude;
    end_longitude = end.longitude;
    return t;
  }

  Widget send_product(context) {
    bool sned = false;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, top: 4, left: 8),
                    child: Text(
                      "موقع الأستلام والتوصيل",
                      style: OfferToBuy.copyWith(
                          color: Colors.blueGrey, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: Card(
                          child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, top: 8, left: 8),
                                child: Text(
                                  "موقع الإرسال",
                                  style: OfferToBuy.copyWith(
                                      color: Colors.blueGrey, fontSize: 20),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.two_wheeler,
                              color: homeColor,
                              size: 120,
                            ),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         MAps_page(),
                                //   ),
                                // );
                              },
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, top: 8, left: 8),
                                  child: Text(
                                    "تحديد",
                                    style: OfferToBuy.copyWith(
                                        color: homeColor, fontSize: 20),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                    Expanded(
                      child: Card(
                          child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Column(
                          children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, top: 8, left: 8),
                                child: Text(
                                  "موقع الإستلام",
                                  style: OfferToBuy.copyWith(
                                      color: Colors.blueGrey, fontSize: 20),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.archive_outlined,
                              color: homeColor,
                              size: 120,
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, top: 8, left: 8),
                                child: Text(
                                  "تحديد",
                                  style: OfferToBuy.copyWith(
                                      color: homeColor, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 8,
                    child: Row(
                      children: [
                        Spacer(),
                        Expanded(
                            flex: 3,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                height: 20,
                                child: TextField(
                                  decoration:
                                      InputDecoration(hintText: "اكتب طلبك"),
                                ),
                              ),
                            )),
                        Spacer(),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                child: Icon(
                                  Icons.filter_outlined,
                                  color: homeColor,
                                  size: MediaQuery.of(context).size.width / 5.4,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                child: Card(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 12,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "يحدد لاحقا",
                            style: TitelStore,
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "إجمالي المبلغ الموقع",
                            style: TitelStore,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " الشروط والأحكام",
                      style: home_font.copyWith(fontSize: 14, color: homeColor),
                    ),
                    Text(
                      "عند إرسال الطلب انت موافق على ",
                      style: home_font.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 13,
                  width: MediaQuery.of(context).size.width - 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: sned ? homeColor : Colors.black38,
                  ),
                  child: Center(
                      child: Text(
                    "أرسل الطلب",
                    style:
                        home_font.copyWith(fontSize: 20, color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget masseg_style(
      {Widget? child, Color? color, BorderRadius? borderRadius}) {
    return Container(
      decoration: BoxDecoration(
          color: color == null ? Colors.white70 : color,
          borderRadius:
              borderRadius == null ? BorderRadius.circular(10) : borderRadius,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ]),
      child: child,
    );
  }
}
