import 'dart:convert';

import 'package:evorgaming/models/tournaments_model.dart';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.code,
    this.games,
    this.featuredTournments,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        code: json["Code"] == null ? null : json["Code"],
        games: json["Games"] == null
            ? null
            : List<Game>.from(json["Games"].map((x) => Game.fromJson(x))),
        featuredTournments: json["featuredTournments"] == null
            ? null
            : List<FeaturedTournment>.from(json["featuredTournments"]
                .map((x) => FeaturedTournment.fromJson(x))),
      );

  String code;
  List<FeaturedTournment> featuredTournments;
  List<Game> games;

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Games": games == null
            ? null
            : List<dynamic>.from(games.map((x) => x.toJson())),
        "featuredTournments": featuredTournments == null
            ? null
            : List<dynamic>.from(featuredTournments.map((x) => x.toJson())),
      };
}

class FeaturedTournment {
  FeaturedTournment({
    this.id,
    this.gameId,
    this.title,
    this.description,
    this.type,
    this.startDateTime,
    this.version,
    this.coverImage,
    this.platform,
    this.entryType,
    this.entryFee,
    this.giftItem,
    this.pointPerKill,
    this.totalPricePool,
    this.map,
    this.isAlreadyParticipant,
    this.tournmentRules,
    this.sponsorBy,
    this.sponsorBanner,
    this.roomSize,
    this.curRoomSize,
  });

  factory FeaturedTournment.fromJson(Map<String, dynamic> json) =>
      FeaturedTournment(
        id: json["id"] == null ? null : json["id"],
        gameId: json["game_id"] == null ? null : json["game_id"],
        title: json["title"] == null ? null : json["title"],
        description: json["Description"] == null ? null : json["Description"],
        type: json["type"] == null ? null : json["type"],
        startDateTime: json["StartDateTime"] == null
            ? null
            : DateTime.parse(json["StartDateTime"]),
        version: json["Version"] == null ? null : json["Version"],
        coverImage: json["Cover_image"] == null ? null : json["Cover_image"],
        platform: json["platform"] == null ? null : json["platform"],
        entryType: json["entry_type"] == null ? null : json["entry_type"],
        entryFee: json["entry_fee"] == null ? null : json["entry_fee"],
        giftItem: json["gift_item"] == null
            ? null
            : GiftItem.fromJson(json["gift_item"]),
        pointPerKill:
            json["point_per_kill"] == null ? null : json["point_per_kill"],
        totalPricePool:
            json["total_price_pool"] == null ? null : json["total_price_pool"],
        map: json["map"] == null ? null : json["map"],
        isAlreadyParticipant: json["is_already_participant"] == null
            ? null
            : json["is_already_participant"],
        tournmentRules:
            json["tournment_rules"] == null ? null : json["tournment_rules"],
        sponsorBy: json["Sponsor_by"] == null
            ? null
            : List<String>.from(json["Sponsor_by"].map((x) => x)),
        sponsorBanner: json["Sponsor_Banner"] == null
            ? null
            : List<String>.from(json["Sponsor_Banner"].map((x) => x)),
        roomSize: json["room_size"] == null ? null : json["room_size"],
        curRoomSize:
            json["cur_room_size"] == null ? null : json["cur_room_size"],
      );

  String coverImage;
  String curRoomSize;
  String description;
  String entryFee;
  String entryType;
  String gameId;
  GiftItem giftItem;
  int id;
  bool isAlreadyParticipant;
  String map;
  String platform;
  String pointPerKill;
  String roomSize;
  List<String> sponsorBanner;
  List<String> sponsorBy;
  DateTime startDateTime;
  String title;
  String totalPricePool;
  String tournmentRules;
  String type;
  String version;

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "game_id": gameId == null ? null : gameId,
        "title": title == null ? null : title,
        "Description": description == null ? null : description,
        "type": type == null ? null : type,
        "StartDateTime":
            startDateTime == null ? null : startDateTime.toIso8601String(),
        "Version": version == null ? null : version,
        "Cover_image": coverImage == null ? null : coverImage,
        "platform": platform == null ? null : platform,
        "entry_type": entryType == null ? null : entryType,
        "entry_fee": entryFee == null ? null : entryFee,
        "gift_item": giftItem == null ? null : giftItem.toJson(),
        "point_per_kill": pointPerKill == null ? null : pointPerKill,
        "total_price_pool": totalPricePool == null ? null : totalPricePool,
        "map": map == null ? null : map,
        "is_already_participant":
            isAlreadyParticipant == null ? null : isAlreadyParticipant,
        "tournment_rules": tournmentRules == null ? null : tournmentRules,
        "Sponsor_by": sponsorBy == null
            ? null
            : List<dynamic>.from(sponsorBy.map((x) => x)),
        "Sponsor_Banner": sponsorBanner == null
            ? null
            : List<dynamic>.from(sponsorBanner.map((x) => x)),
        "room_size": roomSize == null ? null : roomSize,
        "cur_room_size": curRoomSize == null ? null : curRoomSize,
      };
}

class Game {
  Game({
    this.id,
    this.name,
    this.image,
    this.appleUrl,
    this.playstoreUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"] == null ? null : json["id"],
        name: json["Name"] == null ? null : json["Name"],
        image: json["image"] == null ? null : json["image"],
        appleUrl: json["apple_url"] == null ? null : json["apple_url"],
        playstoreUrl:
            json["playstore_url"] == null ? null : json["playstore_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  String appleUrl;
  DateTime createdAt;
  int id;
  String image;
  String name;
  String playstoreUrl;
  DateTime updatedAt;

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "Name": name == null ? null : name,
        "image": image == null ? null : image,
        "apple_url": appleUrl == null ? null : appleUrl,
        "playstore_url": playstoreUrl == null ? null : playstoreUrl,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
