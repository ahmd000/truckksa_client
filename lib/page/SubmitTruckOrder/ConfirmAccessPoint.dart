import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckksa/GetX/GetXSection.dart';
import 'package:truckksa/GetX/GexXUser.dart';
import 'package:truckksa/help/BoxDecoration.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/fuala.dart';
import 'package:truckksa/mudul/url.dart';

import 'OrderConfirmationMessage_page.dart';

class ConfirmAccessPoint extends StatefulWidget {
  int index;
  Map<String, dynamic> data = {};

  ConfirmAccessPoint(this.index, this.data);

  @override
  _ConfirmAccessPointState createState() => _ConfirmAccessPointState();
}

class _ConfirmAccessPointState extends State<ConfirmAccessPoint> {
  var GetXCAtegories = Get.put<GetXData>(GetXData());
  var gexxUser = Get.put<GexXUser>(GexXUser());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Directionality(
            textDirection: settings.lanDirection,
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    lan["ChooseTrucks"],
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
                body: Container(
                  height: height,
                  child: RefreshIndicator(
                    onRefresh: () async => await GetXCAtegories.getdata(),
                    child: ListView.builder(
                        itemCount: GetXCAtegories
                            .data.data[widget.index].product.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return OrderonfirmationMssagePage(
                                        package_id: GetXCAtegories
                                            .data
                                            .data[widget.index]
                                            .product[index]
                                            .product
                                            .id,
                                        start_address:
                                            widget.data["start_address"]!,
                                        start_latitude: double.parse(widget
                                            .data["start_latitude"]
                                            .toString()),
                                        start_longitude: double.parse(widget
                                            .data["start_longitude"]
                                            .toString()),
                                        end_address:
                                            widget.data["end_address"]!,
                                        end_latitude: double.parse(widget
                                            .data["end_latitude"]
                                            .toString()),
                                        end_longitude: double.parse(widget
                                            .data["end_longitude"]
                                            .toString()),
                                        latitude: widget.data["latitude"],
                                        longitude: widget.data["longitude"],
                                      );
                                    });
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: width / 5,
                                        height: width / 5,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(GetXCAtegories
                                                  .data
                                                  .data[widget.index]
                                                  .product[index]
                                                  .product
                                                  .imageProduct
                                                  .imagePage)),
                                        ),
                                      ),
                                      Container(
                                          width: width / 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(13.0),
                                            child: Text(
                                              "${GetXCAtegories.data.data[widget.index].product[index].product.names}",
                                              style: Text1.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Container(
                                    width: width / 4,
                                    child: Text(
                                      "${GetXCAtegories.data.data[widget.index].product[index].product.price} - ${GetXCAtegories.data.data[widget.index].maximumPrice}" +
                                          "  " +
                                          "ريال",
                                      style: Text1.copyWith(fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ))));
  }
}
