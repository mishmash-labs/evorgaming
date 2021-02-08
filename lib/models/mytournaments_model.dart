import 'dart:convert';

import 'package:evorgaming/models/tournamentdetails_model.dart';

MyTournamentPageModel tournamentPageModelFromJson(String str) =>
    MyTournamentPageModel.fromJson(json.decode(str));

String tournamentPageModelToJson(MyTournamentPageModel data) =>
    json.encode(data.toJson());

class MyTournamentPageModel {
  MyTournamentPageModel({
    this.code,
    this.upComing,
    this.ongoing,
    this.completed,
  });

  String code;
  List<TournamentDetailsModel> upComing;
  List<TournamentDetailsModel> ongoing;
  List<TournamentDetailsModel> completed;

  MyTournamentPageModel copyWith({
    String code,
    List<TournamentDetailsModel> upComing,
    List<dynamic> ongoing,
    List<TournamentDetailsModel> completed,
  }) =>
      MyTournamentPageModel(
        code: code ?? this.code,
        upComing: upComing ?? this.upComing,
        ongoing: ongoing ?? this.ongoing,
        completed: completed ?? this.completed,
      );

  factory MyTournamentPageModel.fromJson(Map<String, dynamic> json) =>
      MyTournamentPageModel(
        code: json["Code"] == null ? null : json["Code"],
        upComing: json["UpComing"] == null
            ? null
            : List<TournamentDetailsModel>.from(json["UpComing"]
                .map((x) => TournamentDetailsModel.fromJson(x))),
        ongoing: json["Ongoing"] == null
            ? null
            : List<TournamentDetailsModel>.from(
                json["Ongoing"].map((x) => TournamentDetailsModel.fromJson(x))),
        completed: json["Completed"] == null
            ? null
            : List<TournamentDetailsModel>.from(json["Completed"]
                .map((x) => TournamentDetailsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "UpComing": upComing == null
            ? null
            : List<dynamic>.from(upComing.map((x) => x.toJson())),
        "Ongoing":
            ongoing == null ? null : List<dynamic>.from(ongoing.map((x) => x)),
        "Completed": completed == null
            ? null
            : List<dynamic>.from(completed.map((x) => x.toJson())),
      };
}

class GiftItem {
  GiftItem({
    this.id,
    this.name,
    this.images,
    this.price,
    this.currency,
    this.quantity,
    this.shorDescription,
    this.lonDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String images;
  String price;
  String currency;
  String quantity;
  String shorDescription;
  String lonDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  GiftItem copyWith({
    int id,
    String name,
    String images,
    String price,
    String currency,
    String quantity,
    String shorDescription,
    String lonDescription,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      GiftItem(
        id: id ?? this.id,
        name: name ?? this.name,
        images: images ?? this.images,
        price: price ?? this.price,
        currency: currency ?? this.currency,
        quantity: quantity ?? this.quantity,
        shorDescription: shorDescription ?? this.shorDescription,
        lonDescription: lonDescription ?? this.lonDescription,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory GiftItem.fromJson(Map<String, dynamic> json) => GiftItem(
        id: json["id"] == null ? null : json["id"],
        name: json["Name"] == null ? null : json["Name"],
        images: json["Images"] == null ? null : json["Images"],
        price: json["Price"] == null ? null : json["Price"],
        currency: json["Currency"] == null ? null : json["Currency"],
        quantity: json["Quantity"] == null ? null : json["Quantity"],
        shorDescription:
            json["Shor_description"] == null ? null : json["Shor_description"],
        lonDescription:
            json["lon_description"] == null ? null : json["lon_description"],
        status: json["status"] == null ? null : json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "Name": name == null ? null : name,
        "Images": images == null ? null : images,
        "Price": price == null ? null : price,
        "Currency": currency == null ? null : currency,
        "Quantity": quantity == null ? null : quantity,
        "Shor_description": shorDescription == null ? null : shorDescription,
        "lon_description": lonDescription == null ? null : lonDescription,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
