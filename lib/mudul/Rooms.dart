import 'Chat.dart';
import 'Drives.dart';

class Rooms {
  Rooms({
    required this.id,
    required this.drives,
    required this.stuteroom,
    required this.time,
    required this.chat,
  });

  int id;
  Drives drives;
  bool stuteroom;
  DateTime time;
  List<Chat> chat;

  factory Rooms.fromJson(Map<String, dynamic> json) => Rooms(
        id: json["id"] == null ? 0 : json["id"],
        drives: Drives.fromJson(json["drives"] == null ? {} : json["drives"]),
        stuteroom: json["stuteroom"] == null ? false : json["stuteroom"],
        time: json["time"] == null
            ? DateTime.now()
            : DateTime.parse(json["time"]),
        chat: json["chat"] == null
            ? []
            : List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "drives": drives.toJson(),
        "stuteroom": stuteroom == null ? null : stuteroom,
        "time": time == null ? null : time.toIso8601String(),
        "chat": chat == null
            ? null
            : List<dynamic>.from(chat.map((x) => x.toJson())),
      };
}
