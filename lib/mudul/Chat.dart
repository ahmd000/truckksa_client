class Chat {
  Chat({
    required this.id,
    required this.message,
    required this.customersissends,
    required this.customerSee,
    required this.driveSee,
    required this.idcustomer,
    required this.iddrive,
    required this.time,
  });

  int id;
  String message;
  bool customersissends;
  bool customerSee;
  bool driveSee;
  int idcustomer;
  int iddrive;
  DateTime time;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    id: json["id"] == null ?0 : json["id"],
    message: json["message"] == null ? "null" : json["message"],
    customersissends: json["customersissends"] == null ? false : json["customersissends"],
    customerSee: json["customer_see"] == null ? false : json["customer_see"],
    driveSee: json["drive_see"] == null ? false : json["drive_see"],
    idcustomer: json["idcustomer"] == null ? 0 : json["idcustomer"],
    iddrive: json["iddrive"] == null ? 0 : json["iddrive"],
    time: json["time"] == null ? DateTime.now() : DateTime.parse(json["time"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "message": message == null ? null : message,
    "customersissends": customersissends == null ? null : customersissends,
    "customer_see": customerSee == null ? null : customerSee,
    "drive_see": driveSee == null ? null : driveSee,
    "idcustomer": idcustomer == null ? null : idcustomer,
    "iddrive": iddrive == null ? null : iddrive,
    "time": time == null ? null : time.toIso8601String(),
  };
}
