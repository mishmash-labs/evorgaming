import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.code,
    this.games,
    this.featuredTournments,
  });

  String code;
  List<Game> games;
  List<FeaturedTournment> featuredTournments;

  HomePageModel copyWith({
    String code,
    List<Game> games,
    List<FeaturedTournment> featuredTournments,
  }) =>
      HomePageModel(
        code: code ?? this.code,
        games: games ?? this.games,
        featuredTournments: featuredTournments ?? this.featuredTournments,
      );

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
    this.game,
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
    this.roomId,
    this.roomPassword,
    this.roomVisibilityStaus,
    this.curRoomSize,
    this.playStore,
    this.appleStore,
  });

  int id;
  String gameId;
  String game;
  String title;
  String description;
  String type;
  DateTime startDateTime;
  String version;
  String coverImage;
  String platform;
  String entryType;
  String entryFee;
  dynamic giftItem;
  String pointPerKill;
  String totalPricePool;
  String map;
  bool isAlreadyParticipant;
  String tournmentRules;
  List<String> sponsorBy;
  List<String> sponsorBanner;
  String roomSize;
  String roomId;
  String roomPassword;
  String roomVisibilityStaus;
  String curRoomSize;
  String playStore;
  String appleStore;

  FeaturedTournment copyWith({
    int id,
    String gameId,
    String game,
    String title,
    String description,
    String type,
    DateTime startDateTime,
    String version,
    String coverImage,
    String platform,
    String entryType,
    String entryFee,
    dynamic giftItem,
    String pointPerKill,
    String totalPricePool,
    String map,
    bool isAlreadyParticipant,
    String tournmentRules,
    List<String> sponsorBy,
    List<String> sponsorBanner,
    String roomSize,
    String roomId,
    String roomPassword,
    String roomVisibilityStaus,
    String curRoomSize,
    String playStore,
    String appleStore,
  }) =>
      FeaturedTournment(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
        game: game ?? this.game,
        title: title ?? this.title,
        description: description ?? this.description,
        type: type ?? this.type,
        startDateTime: startDateTime ?? this.startDateTime,
        version: version ?? this.version,
        coverImage: coverImage ?? this.coverImage,
        platform: platform ?? this.platform,
        entryType: entryType ?? this.entryType,
        entryFee: entryFee ?? this.entryFee,
        giftItem: giftItem ?? this.giftItem,
        pointPerKill: pointPerKill ?? this.pointPerKill,
        totalPricePool: totalPricePool ?? this.totalPricePool,
        map: map ?? this.map,
        isAlreadyParticipant: isAlreadyParticipant ?? this.isAlreadyParticipant,
        tournmentRules: tournmentRules ?? this.tournmentRules,
        sponsorBy: sponsorBy ?? this.sponsorBy,
        sponsorBanner: sponsorBanner ?? this.sponsorBanner,
        roomSize: roomSize ?? this.roomSize,
        roomId: roomId ?? this.roomId,
        roomPassword: roomPassword ?? this.roomPassword,
        roomVisibilityStaus: roomVisibilityStaus ?? this.roomVisibilityStaus,
        curRoomSize: curRoomSize ?? this.curRoomSize,
        playStore: playStore ?? this.playStore,
        appleStore: appleStore ?? this.appleStore,
      );

  factory FeaturedTournment.fromJson(Map<String, dynamic> json) =>
      FeaturedTournment(
        id: json["id"] == null ? null : json["id"],
        gameId: json["game_id"] == null ? null : json["game_id"],
        game: json["game"] == null ? null : json["game"],
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
        giftItem: json["gift_item"],
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
        roomId: json["room_id"] == null ? null : json["room_id"],
        roomPassword:
            json["room_password"] == null ? null : json["room_password"],
        roomVisibilityStaus: json["room_visibility_staus"] == null
            ? null
            : json["room_visibility_staus"],
        curRoomSize:
            json["cur_room_size"] == null ? null : json["cur_room_size"],
        playStore: json["playStore"] == null ? null : json["playStore"],
        appleStore: json["AppleStore"] == null ? null : json["AppleStore"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "game_id": gameId == null ? null : gameId,
        "game": game == null ? null : game,
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
        "gift_item": giftItem,
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
        "room_id": roomId == null ? null : roomId,
        "room_password": roomPassword == null ? null : roomPassword,
        "room_visibility_staus":
            roomVisibilityStaus == null ? null : roomVisibilityStaus,
        "cur_room_size": curRoomSize == null ? null : curRoomSize,
        "playStore": playStore == null ? null : playStore,
        "AppleStore": appleStore == null ? null : appleStore,
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

  int id;
  String name;
  String image;
  String appleUrl;
  String playstoreUrl;
  DateTime createdAt;
  DateTime updatedAt;

  Game copyWith({
    int id,
    String name,
    String image,
    String appleUrl,
    String playstoreUrl,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Game(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        appleUrl: appleUrl ?? this.appleUrl,
        playstoreUrl: playstoreUrl ?? this.playstoreUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

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
