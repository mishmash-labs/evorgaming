import 'tournaments_model.dart';

class TournamentDetailsModel {
  TournamentDetailsModel({
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
    this.tournmentRules,
    this.sponsorBy,
    this.sponsorBanner,
    this.roomSize,
    this.curRoomSize,
    this.playStore,
    this.appleStore,
    this.isAlreadyParticipant,
  });

  int id;
  String gameId;
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
  String tournmentRules;
  List<String> sponsorBy;
  List<String> sponsorBanner;
  String roomSize;
  String curRoomSize;
  String playStore;
  String appleStore;
  bool isAlreadyParticipant;

  TournamentDetailsModel copyWith({
    int id,
    String gameId,
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
    String tournmentRules,
    List<String> sponsorBy,
    List<String> sponsorBanner,
    String roomSize,
    String curRoomSize,
    String playStore,
    String appleStore,
    bool isAlreadyParticipant,
  }) =>
      TournamentDetailsModel(
        id: id ?? this.id,
        gameId: gameId ?? this.gameId,
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
        tournmentRules: tournmentRules ?? this.tournmentRules,
        sponsorBy: sponsorBy ?? this.sponsorBy,
        sponsorBanner: sponsorBanner ?? this.sponsorBanner,
        roomSize: roomSize ?? this.roomSize,
        curRoomSize: curRoomSize ?? this.curRoomSize,
        playStore: playStore ?? this.playStore,
        appleStore: appleStore ?? this.appleStore,
        isAlreadyParticipant: isAlreadyParticipant ?? this.isAlreadyParticipant,
      );

  factory TournamentDetailsModel.fromJson(Map<String, dynamic> json) =>
      TournamentDetailsModel(
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
        playStore: json["playStore"] == null ? null : json["playStore"],
        appleStore: json["AppleStore"] == null ? null : json["AppleStore"],
        isAlreadyParticipant: json["is_already_participant"] == null
            ? null
            : json["is_already_participant"],
      );

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
        "tournment_rules": tournmentRules == null ? null : tournmentRules,
        "Sponsor_by": sponsorBy == null
            ? null
            : List<dynamic>.from(sponsorBy.map((x) => x)),
        "Sponsor_Banner": sponsorBanner == null
            ? null
            : List<dynamic>.from(sponsorBanner.map((x) => x)),
        "room_size": roomSize == null ? null : roomSize,
        "cur_room_size": curRoomSize == null ? null : curRoomSize,
        "playStore": playStore == null ? null : playStore,
        "AppleStore": appleStore == null ? null : appleStore,
        "is_already_participant":
            isAlreadyParticipant == null ? null : isAlreadyParticipant,
      };
}
