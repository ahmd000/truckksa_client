import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:truckksa/GetX/GetXSection.dart';
import 'package:truckksa/GetX/GexXUser.dart';
import 'package:truckksa/help/Color.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/Section.dart';
import 'package:truckksa/mudul/url.dart';
import 'package:truckksa/page/Personly/PersonlyPage.dart';
import 'package:truckksa/page/Record/Record_Page.dart';
import 'package:truckksa/page/Registration/Introduction.dart';
import 'package:truckksa/page/SubmitTruckOrder/SubmitTruckOrder.dart';

import '../../mudul/orders.dart';
import '../../mudul/package.dart';
import '../Data.dart';
import '../SubmitTruckOrder/SubmitTruckOrderwathout.dart';
import '../SubmitTruckOrder/send_product.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var GetXCAtegories = Get.put<GetXData>(GetXData());
  var gexXUser = Get.put<GexXUser>(GexXUser());

  late double height;

  late double width;

  @override
  void initState() {
    super.initState();
    GetXCAtegories.getdata();
  }

  int page = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Directionality(
        textDirection: settings.lanDirection,
        child: GetBuilder<GetXData>(
            init: GetXCAtegories,
            builder: (_) {
              return WillPopScope(
                onWillPop: () async {
                  if (page != 0) {
                    setState(() {
                      page = 0;
                    });
                    return false;
                  }
                  return true;
                },
                child: Scaffold(
                    // drawer: Drawer(),
                    body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    page == 0
                        ? Home()
                        : page == 1
                            ? Selct()
                            : send_products(),
                    GetBuilder<GexXUser>(
                        init: gexXUser,
                        builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: InkWell(
                                    onTap: () async {
                                      nav(1);
                                    },
                                    child: Text(
                                      lan["Aboutapp"],
                                      style: Text1000.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: InkWell(
                                    onTap: () async {
                                      nav(2);
                                    },
                                    child: Text(
                                      lan["UsagePolicy"],
                                      style: Text1000.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: InkWell(
                                    onTap: () async {
                                      // await gexXUser.longuot();
                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (BuildContext context) =>
                                      //         introduction(),
                                      //   ),
                                      // );
                                    },
                                    child: Text(
                                      lan["Technicalsupport"],
                                      style: Text1000.copyWith(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: InkWell(
                                    onTap: gexXUser.data.stest
                                        ? () async {
                                            await gexXUser.longuot();
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        introduction(),
                                              ),
                                            );
                                          }
                                        : () async {
                                            // await gexXUser.longuot();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        introduction(),
                                              ),
                                            );
                                          },
                                    child: Text(
                                      gexXUser.data.stest
                                          ? lan["signout"]
                                          : lan["Login"],
                                      style: Text2.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          color: gexXUser.data.stest
                                              ? red
                                              : Green),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                  ],
                )),
              );
            }),
      ),
    );
  }

  Widget Selct() {
    return Container(
      // height: height,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Container(
            height: height / 1.18,
            width: width,
            child: RefreshIndicator(
              onRefresh: () => GetXCAtegories.getdata(),
              child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) => StaggeredTile.count(
                      index == 0 ? 3 : 1, index == 0 ? 1.7 : 1),
                  crossAxisCount: 3,
                  itemCount: GetXCAtegories.data.data.length + 1,
                  itemBuilder: (context, indexs) {
                    int index = indexs;
                    index--;
                    return indexs == 0
                        ? Column(
                            children: [
                              Container(
                                  width: width / 1.1,
                                  height: height / 5.5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            "Asset/image/banner.png")),
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                              Text(
                                lan["Bookflight"],
                                style: Text1.copyWith(
                                    fontSize: height / 50,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(lan["Orderfromstoresorderwilldelivered"],
                                  style: Text1.copyWith(
                                    fontSize: height / 60,
                                  ))
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SubmitTruckOrder(index)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      )
                                    ]
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: height / 10,
                                      width: width / 4,
                                      decoration: BoxDecoration(
                                          // color: Colors.black12,
                                          image: DecorationImage(
                                              // image: NetworkImage(product
                                              //     .imageProduct
                                              //     .imagePage)
                                              image: NetworkImage(GetXCAtegories
                                                  .data
                                                  .data[index]
                                                  .sectionimage
                                                  .imagePage)),
                                          borderRadius:
                                              BorderRadius.circular(10)),

                                      // decoration: BoxDecoration(
                                      //   image: DecorationImage(
                                      //       fit: BoxFit.fitWidth,
                                      //       image: NetworkImage(GetXCAtegories
                                      //           .data
                                      //           .data[index]
                                      //           .sectionimage
                                      //           .imagePage)),
                                      // ),
                                    ),
                                    Center(
                                        child: Text(GetXCAtegories
                                            .data.data[index].name))
                                  ],
                                ),
                              ),
                            ),
                          );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Widget Home() {
    return Container(
      width: width,
      // height: height,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: width / 14.0, right: width / 14.0, top: height / 25),
            child: Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 15,
              color: Colors.white,
              child: Container(
                height: height / 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (!dbloy()) return;
                        setState(() {
                          page = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Asset/image/car.png',
                            fit: BoxFit.fill,
                            height: height / 18,
                            width: height / 10,
                          ),
                          Text(
                            lan["cars"],
                            style: Text1111,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        // if (!dbloy()) return;
                        setState(() {
                          page = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Asset/image/sendr.png',
                            fit: BoxFit.contain,
                            height: height / 13,
                            width: height / 10,
                          ),
                          Text(
                            lan["Orderanddelivery"],
                            style: Text1111,
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (!dbloy()) return;
                        setState(() {
                          nav(3);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'Asset/image/manager.png',
                            fit: BoxFit.contain,
                            height: height / 13,
                            width: height / 10,
                          ),
                          Text(
                            lan["Profilepersonly"],
                            style: Text1111,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          gexXUser.data.data.customers.isEmpty
              ? Container()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: width / 14.0, top: height / 50),
                      child: Container(
                        decoration: BoxDecoration(
                            color: BakColor,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomLeft: Radius.circular(5))),
                        // width: width / 10,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: width / 40.0, right: width / 40.0),
                          child: Text(lan["mytrips"], style: Text00),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: width / 14.0, top: height / 50),
                      child: InkWell(
                        onTap: () {
                          nav(0);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: BakColor,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomLeft: Radius.circular(5))),
                          // width: width / 10,
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: width / 40.0, right: width / 40.0),
                            child: Text(lan["More"], style: Text00),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
          gexXUser.data.data.customers.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(
                      left: width / 14.0,
                      right: width / 14.0,
                      top: height / 100),
                  child: Material(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    elevation: 15,
                    color: Colors.white,
                    child: Container(
                        height: height / 3.5,
                        width: width,
                        child: ListView.builder(
                            itemCount:
                                !(gexXUser.data.data.customers.length < 6)
                                    ? 6
                                    : gexXUser.data.data.customers.length,
                            itemBuilder: (context, index) {
                              Data _order = gexXUser.data.data.customers[index];

                              int price = 0;
                              for (int i = 0;
                                  i < _order.ordersProducts.length;
                                  i++) {
                                try {
                                  price += int.parse(
                                      _order.ordersProducts[i].product.price);
                                } catch (e) {}
                              }

                              return Container(
                                width: width,
                                height: height / 5,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(width: 8),
                                    Column(
                                      children: [
                                        Container(
                                          height: height / 50,
                                          width: height / 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: BakColor, width: 2),
                                              shape: BoxShape.circle),
                                          // color: Colors.black26,
                                        ),
                                        SizedBox(height: 3),
                                        Container(
                                          height: height / 9,
                                          width: 2,
                                          color: BakColor,
                                        ),
                                        SizedBox(height: 3),
                                        Container(
                                          height: height / 50,
                                          width: height / 50,

                                          decoration: BoxDecoration(
                                              color: BakColor,
                                              shape: BoxShape.circle),
                                          // color: Colors.black26,
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 8),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(width: 8),
                                            Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Text(lan["Journeystart"],
                                                  style: Text1111),
                                            ),
                                            SizedBox(width: 8),
                                            Container(
                                              height: height / 40,
                                              width: width / 1.35,
                                              child: Text(
                                                _order.startLocationAddress,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: BakColorefefef,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Text(
                                                  lan["endofthejourney"],
                                                  style: Text1111),
                                            ),
                                            SizedBox(width: 8),
                                            Container(
                                              height: height / 40,
                                              width: width / 1.35,
                                              child: Text(
                                                _order.arriveLocationAddress,
                                                textAlign: TextAlign.start,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              decoration: BoxDecoration(
                                                  color: BakColorefefef,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: List.generate(2, (index) {
                                            // Product _product =
                                            // _order.ordersProducts[index];
                                            return Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: _order.acase ==
                                                                "7" ||
                                                            _order.acase ==
                                                                "6" ||
                                                            _order.acase == "5"
                                                        ? Colors.red
                                                        : _order.acase == "8"
                                                            ? Colors.green
                                                            : BakColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                // height: height / 30,
                                                child: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: Text(
                                                      index == 0
                                                          ? price.toString()
                                                          : lan[_order.acase],
                                                      style: Text000),
                                                ),
                                              ),
                                            );
                                          }),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            })),
                  ),
                )
              : Container(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: width / 14.0, top: height / 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: BakColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5))),
                  // width: width / 10,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width / 40.0, right: width / 40.0),
                    child: Text(lan["Proposals"], style: Text00),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                left: width / 14.0, right: width / 14.0, top: height / 100),
            child: Material(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30)),
              elevation: 15,
              color: Colors.white,
              child: Container(
                  height: height / 5.43,
                  width: width,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // SizedBox(width: 10),
                          Container(
                            height: height / 27,
                            width: width / 1.35,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: lan["Search"],
                                    border: InputBorder.none),

                                textAlign: TextAlign.start,
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: BakColorefefef,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: BakColor, shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                      Builder(builder: (context) {
                        List<ProductClass> data = [];
                        // List<Product> datas = data.map((e) => e)
                        // List<ProductClass>dataa = data.map((e) =>
                        //     e.map((e) =>
                        //     e.product)).toList();
                        for (int i = 0;
                            i < GetXCAtegories.data.data.length && i < 6;
                            i++) {
                          data.addAll(GetXCAtegories.data.data[i].product
                              .map((e) => e.product)
                              .toList());
                        }
                        return Container(
                          height: height / 7,
                          width: width / 1.1,
                          // color: Colors.green,
                          child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                ProductClass product = data[index];
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    // color: Colors.black12,

                                    width: width / 6,
                                    child: InkWell(
                                      onTap: () {
                                        if (!dbloy()) return;
                                        // int indexs = GetXCAtegories.data.data
                                        //     .indexWhere((element) =>
                                        //         element.product
                                        //             .firstWhereOrNull(
                                        //                 (element) =>
                                        //                     element
                                        //                         .product.id ==
                                        //                     product.id) !=
                                        //         null);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SubmitTruckOrderOut(
                                                        product.id)));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            // width: ,
                                            height: height / 13,
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                image: DecorationImage(
                                                    image: NetworkImage(product
                                                        .imageProduct
                                                        .imagePage)),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          SizedBox(height: 8),
                                          Container(
                                            width: width / 6,
                                            child: Text(product.names,
                                                overflow: TextOverflow.ellipsis,
                                                style: Text0000),
                                            // height: height / 30,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          // Container(
                                          //   // width: ,
                                          //   height: height / 4,
                                          //   color: Colors.black12,
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      })
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }

  void nav(int Index) {
    if (Index == 0)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => recordPage()));
    if (Index == 1)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DataPageShow(
                  lan["Aboutapp"],
                  GetXCAtegories.datap.data
                      .firstWhereOrNull(
                          (element) => element.paragraphnumber == "1")
                      ?.details)));
    if (Index == 2)
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DataPageShow(
                  lan["UsagePolicy"],
                  GetXCAtegories.datap.data
                      .firstWhereOrNull(
                          (element) => element.paragraphnumber == "2")
                      ?.details)));
    if (Index == 3)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => personlyPage()));
  }

  Widget Drawer() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<GexXUser>(
        init: gexXUser,
        builder: (_) {
          return Container(
            width: width / 1.5,
            height: height,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: height / 60,
                    ),
                    Container(
                      height: width / 3.3,
                      width: width / 3.3,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(uri +
                                  gexXUser
                                      .data.data.customersimage.imagePage))),
                    ),
                    Text(
                      gexXUser.data.data.name,
                      style: Text2.copyWith(fontSize: 16),
                    ),
                  ],
                ),
                Container(
                  height: height / 2,
                  child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => nav(index),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Icon(
                                  index == 0
                                      ? Icons.nineteen_mp
                                      : index == 1
                                          ? Icons.info_outline_rounded
                                          : index == 2
                                              ? Icons.policy
                                              : Icons.settings,
                                  color: btnborder2,
                                  size: height / 24,
                                ),
                              ),
                              Text(
                                lan[index == 0
                                    ? "records"
                                    : index == 1
                                        ? "Aboutapp"
                                        : index == 2
                                            ? "UsagePolicy"
                                            : "Settings"],
                                style: Text2.copyWith(fontSize: 16),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  child: InkWell(
                    onTap: () async {
                      await gexXUser.longuot();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => introduction(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Image.asset(
                            "Asset/image/longout.jpeg",
                            height: height / 24,
                          ),
                        ),
                        Text(
                          lan["signout"],
                          style: Text2.copyWith(fontSize: 16, color: red),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  bool dbloy() {
    if (!gexXUser.data.stest)
      showDialog(
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                left: width / 30,
                right: width / 30,
                top: height / 3.5,
                bottom: height / 3.5,
              ),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Scaffold(
                    backgroundColor: Colors.white,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            height: height / 3.8,
                            width: height / 3.8,
                            decoration: BoxDecoration(
                                // color: Colors.black,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("Asset/image/long.png"))),
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      introduction(),
                                ),
                              );
                            },
                            child: Text(lan["Login"], style: Tite)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
    return gexXUser.data.stest;
  }
}
