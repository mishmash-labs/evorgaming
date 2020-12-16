import 'dart:convert';

PaymentMethodsModel paymentMethodsModelFromJson(String str) =>
    PaymentMethodsModel.fromJson(json.decode(str));

String paymentMethodsModelToJson(PaymentMethodsModel data) =>
    json.encode(data.toJson());

class PaymentMethodsModel {
  PaymentMethodsModel({
    this.code,
    this.message,
  });

  String code;
  List<Message> message;

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json) =>
      PaymentMethodsModel(
        code: json["Code"] == null ? null : json["Code"],
        message: json["Message"] == null
            ? null
            : List<Message>.from(
                json["Message"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Message": message == null
            ? null
            : List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  dynamic createdAt;
  dynamic updatedAt;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
