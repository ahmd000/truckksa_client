import 'package:flutter/material.dart';
import 'package:truckksa/help/Color.dart';
import 'package:truckksa/help/TextStyle.dart';
import 'package:truckksa/main.dart';

class DataPageShow extends StatelessWidget {
  String Titel;
  String? Data;

  DataPageShow(this.Titel, this.Data);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: settings.lanDirection,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              Titel,
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
            width: width,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                Data == null ? "" : Data!,
                style: Text1.copyWith(fontSize: 20, color: btnborder1),
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
