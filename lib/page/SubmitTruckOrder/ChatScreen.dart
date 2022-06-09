import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../GetX/GexXUser.dart';
import '../../help/Color.dart';
import '../../help/lan.dart';
import '../../mudul/Rooms.dart';
import '../../mudul/fuala.dart';

class ChatScreen extends StatefulWidget {
  int index;

  ChatScreen(this.index);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var gexXUser = Get.put<GexXUser>(GexXUser());

  TextEditingController value = TextEditingController();
  Rooms room = Rooms.fromJson({});

  init() {
    room = gexXUser.data.data.customers[widget.index].rooms
        .firstWhereOrNull((element) => element.stuteroom)!;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GetBuilder<GexXUser>(
          init: gexXUser,
          builder: (_) {
            init();
            if (room == null) {
              Navigator.pop(context);
              return Container();
            }

            return Scaffold(
                appBar: AppBar(
                  elevation: 3,
                  automaticallyImplyLeading: false,
                  backgroundColor: BakColor,
                  leading: Icon(null),

                  // title:
                  actions: [
                    Container(
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.call, size: 20),
                                  color: appbaricon,
                                  onPressed: () {
                                    launch("tel:" + room.drives.mobilenumber);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    room.drives.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: appbaricon,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    lan[room.stuteroom ? "open" : "closed"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: !room.stuteroom
                                          ? red
                                          : Colors.greenAccent,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Container(
                                  width: width / 8,
                                  height: height / 18,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black12,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          room.drives.imageId.imagePage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.videocam, size: 20),
                    //   color: appbaricon,
                    //   onPressed: () {},
                    // ),
                    // IconButton(
                    //   icon: Icon(Icons.more_vert, size: 20),
                    //   color: appbaricon,
                    //   onPressed: () {},
                    // ),
                  ],
                ),
                body: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: height / 15,
                        child: Container(
                            width: width,
                            // color: Colors.red,
                            child: ListView.builder(
                                itemCount: room.chat.length,
                                itemBuilder: (context, index) {
                                  return MessageBox(
                                    message: room.chat[index].message,
                                    isMe: room.chat[index].customersissends,
                                  );
                                })),
                      ),
                      Positioned(
                          height: height / 15,
                          bottom: 0,
                          width: width,
                          child: Container(
                            color: mainColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      sand(value.text, room.id, room.stuteroom);
                                      value.text = "";
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white54),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Icon(
                                          Icons.send,
                                          color: mainColor,
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: width / 1.2,
                                    decoration: BoxDecoration(
                                        // backgroundBlendMode: BlendMode,
                                        color: Colors.white70,
                                        boxShadow: [
                                          BoxShadow(color: Colors.black38)
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: TextField(
                                        controller: value,
                                        textDirection: TextDirection.rtl,
                                        decoration: InputDecoration(
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ),
                                // Padding(
                                //   padding: const EdgeInsets.all(2.0),
                                // )
                              ],
                            ),
                          ))
                    ],
                  ),
                ));
          }),
    );
  }
}

sand(String v, int id, bool send) {
  if (v.isEmpty && send) return;
  fuataOrder.sendchat(message: v, idroom: id.toString());
  // value.text = "";
}

class MessageBox extends StatelessWidget {
  final bool isMe;
  final String message;

  const MessageBox({
    // Key key,
    required this.isMe,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Text(
                    message,
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }
}
