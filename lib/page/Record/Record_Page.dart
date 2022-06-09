import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckksa/GetX/GexXUser.dart';
import 'package:truckksa/help/Color.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/fuala.dart';

import '../SubmitTruckOrder/ChatScreen.dart';
import 'LogTracking_page.dart';

class recordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var gexXUser = Get.put<GexXUser>(GexXUser());

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Directionality(
            textDirection: settings.lanDirection,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    lan["records"],
                    style: Text1,
                  ),
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black54,
                    ),
                  ),
                ),
                body: GetBuilder<GexXUser>(
                  init: gexXUser,
                  builder: (_) {
                    return Container(
                      height: height,
                      width: width,
                      child: RefreshIndicator(
                        onRefresh: () async =>
                            fuatalong.getbyid(id: gexXUser.data.data.id),
                        child: ListView.builder(
                            itemCount: gexXUser.data.data.customers.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: () async {
                                    var order =
                                        gexXUser.data.data.customers[index];
                                    if (order.acase == "2" ||
                                        order.acase == "3" ||
                                        order.acase == "4"){
                                      // print("///////////////////////////////");
                                      // print(order.rooms[0].toJson());
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ChatScreen(index)));
                                      return;
                                    }
                                    var datareturn = await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                logTrackingPage(index)));
                                    if (datareturn == null || !datareturn)
                                      return;
                                    fuatalong.getbyid(
                                        id: gexXUser.data.data.id);
                                  },
                                  child: Container(
                                    width: width,
                                    height: height / 5,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 2,
                                              spreadRadius: 2)
                                        ]),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  // child: Text(
                                                  //   gexXUser.data.data.customers[index].
                                                  //   style: Text1,
                                                  // ),
                                                  ),
                                              Text(
                                                "${gexXUser.data.data.customers[index].price} SAR",
                                                style: Text1.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: width / 25,
                                              ),
                                              Image.asset(
                                                "Asset/image/location-green.png",
                                                height: height / 30,
                                              ),
                                              SizedBox(
                                                width: width / 20,
                                              ),
                                              Container(
                                                  width: width / 1.33,
                                                  child: Text(
                                                    gexXUser
                                                        .data
                                                        .data
                                                        .customers[index]
                                                        .startLocationAddress,
                                                    style: Text1.copyWith(
                                                        fontSize: width / 21),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: width / 15,
                                              ),
                                              Image.asset(
                                                "Asset/image/location-red.png",
                                                height: height / 30,
                                              ),
                                              SizedBox(
                                                width: width / 20,
                                              ),
                                              Container(
                                                  width: width / 1.33,
                                                  child: Text(
                                                    gexXUser
                                                        .data
                                                        .data
                                                        .customers[index]
                                                        .arriveLocationAddress,
                                                    style: Text1.copyWith(
                                                        fontSize: width / 21),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                            ],
                                          ),
                                          Container(
                                              width: width,
                                              child: Text(
                                                lan[gexXUser
                                                            .data
                                                            .data
                                                            .customers[index]
                                                            .acase] ==
                                                        null
                                                    ? ""
                                                    : lan[gexXUser
                                                        .data
                                                        .data
                                                        .customers[index]
                                                        .acase],
                                                style: Text1.copyWith(
                                                    fontSize: width / 22,
                                                    color: Green),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
                  },
                ))));
  }
}
