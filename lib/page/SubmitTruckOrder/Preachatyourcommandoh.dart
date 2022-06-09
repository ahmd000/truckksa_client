import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../help/Color.dart';
import '../../help/lan.dart';
import 'GetLocationPage.dart';

class Preachatyourcommandoh extends StatefulWidget {
  LatLng? position1;
  LatLng? position2;
  Map<String, dynamic>? data;

  Preachatyourcommandoh({this.data}) {
    try {
      position1 = data!["position1"];
      // position2 = data!["position2"];
    } catch (e) {}
    try {
      // position1 = data!["position1"];
      position2 = data!["position2"];
    } catch (e) {}
  }

  @override
  _PreachatyourcommandohState createState() => _PreachatyourcommandohState();
}

class _PreachatyourcommandohState extends State<Preachatyourcommandoh> {
  bool Asksite = false;
  bool Receivinglocation = false;
  Map<String, dynamic> res = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Asksite = widget.position1 != null;
    Receivinglocation = widget.position2 != null;
    res = widget.data!;
  }

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                lan["Canyouspecifythereceivingandsendinglocation"],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7),
                    fontFamily: "TajawalMedium"),
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        lan["Asksite"],
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontFamily: "TajawalMedium"),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          var data = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (con) =>
                                      GetLocationPage(widget.position1)));
                          if (data == null) return;
                          data = (data as Map<String, dynamic>);
                          res.addAll({
                            "ti1": data["ti"],
                            "position1": data["position"],
                          });
                          widget.position1 = data["position"];
                          setState(() {
                            Asksite = true;
                          });
                        },
                        child: Text(
                          lan[Asksite ? "selected" : "specify"],
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
                ],
              ),
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        lan["Receivinglocation"],
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontFamily: "TajawalMedium"),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          print(res);

                          var data = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (con) =>
                                      GetLocationPage(widget.position2)));
                          if (data == null) return;
                          data = (data as Map<String, dynamic>);
                          res.addAll({
                            "ti2": data["ti"],
                            "position2": data["position"],
                          });
                          widget.position2 = data["position"];
                          setState(() {
                            Receivinglocation = true;
                          });
                          print(res);

                          if (res["ti1"] != null && res["position1"] != null)
                            Navigator.pop(context, res);
                        },
                        child: Text(
                          lan[Receivinglocation ? "selected" : "specify"],
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
