class Paragraphs {
  Paragraphs({
    required this.stest,
    required this.data,
    required this.mesg,
  });

  bool stest;
  List<Datum> data;
  String mesg;

  factory Paragraphs.fromJson(Map<String, dynamic> json) => Paragraphs(
        stest: json["stest"] == null ? false : json["stest"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        mesg: json["mesg"] == null ? "null" : json["mesg"],
      );

  Map<String, dynamic> toJson() => {
        "stest": stest == null ? null : stest,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "mesg": mesg == null ? null : mesg,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.details,
    required this.paragraphnumber,
    required this.paragraphname,
    required this.titel,
  });

  int id;
  String details;
  String paragraphnumber;
  String paragraphname;
  String titel;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? 0 : json["id"],
        details: json["details"] == null ? "null" : json["details"],
        paragraphnumber:
            json["paragraphnumber"] == null ? "0" : json["paragraphnumber"],
        paragraphname:
            json["paragraphname"] == null ? "null" : json["paragraphname"],
        titel: json["titel"] == null ? "null" : json["titel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "details": details == null ? null : details,
        "paragraphnumber": paragraphnumber == null ? null : paragraphnumber,
        "paragraphname": paragraphname == null ? null : paragraphname,
        "titel": titel == null ? null : titel,
      };
}
