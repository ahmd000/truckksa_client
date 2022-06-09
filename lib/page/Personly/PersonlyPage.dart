import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:truckksa/GetX/GexXUser.dart';
import 'package:truckksa/help/BoxDecoration.dart';
import 'package:truckksa/help/Color.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/help/lan.dart';
import 'package:truckksa/main.dart';
import 'package:truckksa/mudul/fuala.dart';

class personlyPage extends StatefulWidget {
  @override
  _personlyPageState createState() => _personlyPageState();
}

class _personlyPageState extends State<personlyPage> {
  var user = Get.put<GexXUser>(GexXUser());
  TextEditingController _nameControler = TextEditingController();
  TextEditingController _numberControler = TextEditingController();
  TextEditingController _EmailControler = TextEditingController();
  TextEditingController _pasControler = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filedata();
  }

  filedata() {
    _nameControler.text = user.data.data.name;
    _numberControler.text = user.data.data.mobilenumber;
    _EmailControler.text = user.data.data.email;
    _pasControler.text = user.data.data.password;
  }

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
                    lan["Settings"],
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
                  width: width,
                  height: height,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.asset(
                              "Asset/image/personicon.jpeg",
                              height: width / 3.3,
                              width: width / 3.3,
                            ),
                          ),
                          Text(
                            lan["Personaldata"],
                            style: Text1,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.person,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["name"],
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      controller: _nameControler,
                                      style: Text1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.phone_iphone_sharp,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["phone"],
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      readOnly: true,
                                      controller: _numberControler,
                                      style: Text1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.alternate_email_rounded,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["Email"],
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      controller: _EmailControler,
                                      style: Text1,
                                      readOnly: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Icon(
                                      Icons.lock_outline,
                                      color: btnborder2,
                                      size: height / 18,
                                    ),
                                  ),
                                  Text(
                                    lan["password"],
                                    style: Text111,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width / 13,
                                  ),
                                  Container(
                                    width: width / 1.2,
                                    height: height / 30,
                                    child: TextField(
                                      controller: _pasControler,
                                      style: Text1,
                                      decoration: InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: InkWell(
                                onTap: () {
                                  Map<String, dynamic> date = {};
                                  if (_nameControler.text !=
                                          user.data.data.name &&
                                      _nameControler.text.isNotEmpty)
                                    date.addAll({"name": _nameControler.text});
                                  if (_EmailControler.text !=
                                          user.data.data.email &&
                                      _EmailControler.text.isNotEmpty)
                                    date.addAll(
                                        {"email": _EmailControler.text});
                                  if (_numberControler.text !=
                                          user.data.data.mobilenumber &&
                                      _numberControler.text.isNotEmpty)
                                    date.addAll({
                                      "mobilenumber": _numberControler.text
                                    });
                                  if (_pasControler.text !=
                                          user.data.data.password &&
                                      _pasControler.text.isNotEmpty)
                                    date.addAll(
                                        {"password": _pasControler.text});
                                  if (date.isEmpty) return;
                                  fuatalong.changeuser(
                                      mobilenumber: user.data.data.mobilenumber,
                                      password: user.data.data.password,
                                      data: date);
                                },
                                child: Container(
                                  width: width / 1.3,
                                  height: height / 16,
                                  decoration: BtnBluBD,
                                  alignment: Alignment.center,
                                  child: Text(
                                    lan["Modification"],
                                    style: Text11.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            lan["GeneralSettings"],
                            style: Text1,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.language,
                                  color: btnborder2,
                                  size: height / 18,
                                ),
                              ),
                              Text(
                                lan["language"],
                                style: Text111,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: true,
                                groupValue: "lan",
                                onChanged: (v) {},
                              ),
                              Text(
                                lan["Arabic"],
                                style: Text111,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: true,
                                groupValue: "lan",
                                onChanged: (v) {},
                              ),
                              Text(
                                lan["English"],
                                style: Text111,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))));
  }
}
