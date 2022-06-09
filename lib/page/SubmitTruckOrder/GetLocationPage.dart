import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:truckksa/help/BoxDecoration.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/fuala.dart';

import 'ConfirmAccessPoint.dart';

class GetLocationPage extends StatefulWidget {
  LatLng? data;

  GetLocationPage(this.data);

  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  Marker? _marker;
  bool type = true;
  Map<String, dynamic> data = {};
  Location location = new Location();
  late GoogleMapController _Controller;
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;
  late CameraPosition CP;

  Future<void> int() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        Get.snackbar(
            lan["Thereisaproblem"], lan["Menactivatethelocationfeature"],
            backgroundColor: Colors.white);
        Navigator.pop(context);
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      // Get.defaultDialog(
      //     title: lan[""],
      //     // middleText: lan["Helpusprovideyouwithbetterqualityservice"],
      //     actions: [
      //       Builder(builder: (context) {
      //         var width = MediaQuery.of(context).size.width;
      //         var height = MediaQuery.of(context).size.height;
      //         return Container(
      //           child: Row(
      //             children: [
      //               Container(
      //                 width: width / 4,
      //                 color: Colors.black38,
      //                 child: Text("data"),
      //               )
      //             ],
      //           ),
      //         );
      //       })
      //     ]);

      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Get.snackbar(
            lan["Thereisaproblem"], lan["Menactivatethelocationfeature"],
            backgroundColor: Colors.white);
        Navigator.pop(context);
        return;
      }
    }

    _locationData = await location.getLocation();
    await inst(LatLng(_locationData!.latitude!, _locationData!.longitude!));

    setState(() {
      _marker;
    });
    titel1 = (await fuataGooglemap.PlusCodes(
            _locationData!.latitude!, _locationData!.longitude!))
        //     .then((value) {
        //   // setState(() {
        //   //    = value;
        //   // });
        // })
        .plusCode
        .compoundCode;
    setState(() {
      titel1;
    });
    // .plusCode
    // .compoundCode;
    setState(() {
      titel1;
      // CP = ;
      print(CP);
      CameraUpdate update = CameraUpdate.newLatLng(
          LatLng(_locationData!.latitude!, _locationData!.longitude!));
      _Controller.animateCamera(update);
      print("///////////////////////////////////////////");

      // type = false;
    });
  }

  Future<Marker> latLng(LatLng latLng, bool type) async {
    // final Uint8List blankIcon =
    // await getBytesFromAsset('assets/blank_marker.png', 100);
    // var icon = await  BitmapDescriptor.fromAssetImage(
    //     ImageConfiguration(size: Size(5,5)),
    //     type?"Asset/image/location-green.png":"Asset/image/location-red.png",);
    return Marker(
      markerId: MarkerId("se"),
      position: latLng,
      zIndex: 0,

      // icon: icon
    );
  }

  String titel1 = "";

  // String titel2 = "";

  @override
  void initState() {
    // TODO: implement initState
    CP = CameraPosition(zoom: 13, target: LatLng(26.415207, 50.087357));
    super.initState();
    if (widget.data == null)
      int();
    else {
      init();
    }
  }

  init() async {
    await inst(widget.data!);

    titel1 = (await fuataGooglemap.PlusCodes(
            widget.data!.latitude, widget.data!.longitude))
        //     .then((value) {
        //   // setState(() {
        //   //    = value;
        //   // });
        // })
        .plusCode
        .compoundCode;
    setState(() {
      titel1;
    });
    // print(widget.data!);
    // CameraUpdate update = CameraUpdate.newLatLng(
    //     LatLng(widget.data!.latitude, widget.data!.longitude));
    // // _Controller.
    // _Controller.animateCamera(update);
  }

  Future<void> inst(LatLng latLngs) async {
    _marker = await latLng(latLngs, type);

    setState(() {
      _marker;
    });
    print(_marker);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Directionality(
        textDirection: settings.lanDirection,
        child: Scaffold(
          body: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                GoogleMap(
                    onMapCreated: (GoogleMapController _Controller) {
                      this._Controller = _Controller;
                      if (widget.data == null) return;
                      CameraUpdate update = CameraUpdate.newLatLng(LatLng(
                          widget.data!.latitude, widget.data!.longitude));
                      // _Controller.
                      _Controller.animateCamera(update);
                    },
                    myLocationButtonEnabled: false,
                    markers: Set<Marker>.of(_marker == null ? [] : [_marker!]),
                    onCameraMove: (CameraPosition x) {
                      print(x.target.latitude);
                      print(x.target.latitude);

                      inst(x.target);
                    },
                    initialCameraPosition: CP),
                Positioned(
                  top: height / 50,
                  left: width / 30,
                  right: width / 30,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width,
                          // height: height / 18,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  "Asset/image/location-green.png",
                                  height: height / 30,
                                ),
                                SizedBox(
                                  width: width / 40,
                                ),
                                Container(
                                    width: width / 1.3,
                                    // color: Colors.amber,
                                    child: Text(
                                      titel1,
                                      style: Text0.copyWith(
                                          color: Colors.black.withOpacity(0.8)),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: height / 1.26,
                  left: width / 30,
                  right: width / 30,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Map<String, dynamic> data = {
                          "ti": titel1,
                          "position": _marker?.position,
                          // "lng":"",
                        };
                        // data.a
                        if (_marker != null) Navigator.pop(context, data);
                      },
                      child: Container(
                        width: width,
                        // height: height / 18,
                        alignment: Alignment.center,
                        decoration: BtnBluBD,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            lan["specify"],
                            style: Text11.copyWith(fontWeight: FontWeight.bold),
                          ),
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
    );
  }
}
