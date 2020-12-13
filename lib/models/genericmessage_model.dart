import 'dart:convert';

GenericMessageModel genericMessageModelFromJson(String str) =>
    GenericMessageModel.fromJson(json.decode(str));

String genericMessageModelToJson(GenericMessageModel data) =>
    json.encode(data.toJson());

class GenericMessageModel {
  GenericMessageModel({
    this.code,
    this.message,
  });

  factory GenericMessageModel.fromJson(Map<String, dynamic> json) =>
      GenericMessageModel(
        code: json["Code"] == null ? null : json["Code"],
        message: json["Message"] == null ? null : json["Message"],
      );

  String code;
  dynamic message;

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Message": message == null ? null : message,
      };
}
