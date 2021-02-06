import 'dart:convert';

TournamentDetailsModel tournamentDetailsModelFromJson(String str) =>
    TournamentDetailsModel.fromJson(json.decode(str));

String tournamentDetailsModelToJson(TournamentDetailsModel data) =>
    json.encode(data.toJson());

class TournamentDetailsModel {
  TournamentDetailsModel({
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
    this.curRoomSize,
    this.roomId,
    this.roomPassword,
    this.roomVisibilityStaus,
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
  GiftItem giftItem;
  String pointPerKill;
  String totalPricePool;
  String map;
  bool isAlreadyParticipant;
  String tournmentRules;
  List<String> sponsorBy;
  List<String> sponsorBanner;
  String roomSize;
  String curRoomSize;
  String roomId;
  String roomPassword;
  String roomVisibilityStaus;
  String playStore;
  String appleStore;

  TournamentDetailsModel copyWith({
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
    GiftItem giftItem,
    String pointPerKill,
    String totalPricePool,
    String map,
    bool isAlreadyParticipant,
    String tournmentRules,
    List<String> sponsorBy,
    List<String> sponsorBanner,
    String roomSize,
    String curRoomSize,
    String roomId,
    String roomPassword,
    String roomVisibilityStaus,
    String playStore,
    String appleStore,
  }) =>
      TournamentDetailsModel(
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
        curRoomSize: curRoomSize ?? this.curRoomSize,
        roomId: roomId ?? this.roomId,
        roomPassword: roomPassword ?? this.roomPassword,
        roomVisibilityStaus: roomVisibilityStaus ?? this.roomVisibilityStaus,
        playStore: playStore ?? this.playStore,
        appleStore: appleStore ?? this.appleStore,
      );

  factory TournamentDetailsModel.fromJson(Map<String, dynamic> json) =>
      TournamentDetailsModel(
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
        roomId: json["room_id"] == null ? null : json["room_id"],
        roomPassword:
            json["room_password"] == null ? null : json["room_password"],
        roomVisibilityStaus: json["room_visibility_staus"] == null
            ? null
            : json["room_visibility_staus"],
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
        "room_id": roomId == null ? null : roomId,
        "room_password": roomPassword == null ? null : roomPassword,
        "room_visibility_staus":
            roomVisibilityStaus == null ? null : roomVisibilityStaus,
        "playStore": playStore == null ? null : playStore,
        "AppleStore": appleStore == null ? null : appleStore,
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
