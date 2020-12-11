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
  String pointPerKill;
  String totalPricePool;
  String map;
  bool isAlreadyParticipant;
  String tournmentRules;
  List<String> sponsorBy;
  List<String> sponsorBanner;
  String roomSize;
  String curRoomSize;

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
