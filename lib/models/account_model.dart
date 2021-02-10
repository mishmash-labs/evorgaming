import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    this.code,
    this.profileDetails,
    this.characterId,
    this.transaction,
    this.orders,
    this.withdrawals,
  });

  String code;
  ProfileDetails profileDetails;
  List<CharacterId> characterId;
  List<Transaction> transaction;
  List<Order> orders;
  List<Withdrawal> withdrawals;

  AccountModel copyWith({
    String code,
    ProfileDetails profileDetails,
    List<CharacterId> characterId,
    List<Transaction> transaction,
    List<Order> orders,
    List<Withdrawal> withdrawals,
  }) =>
      AccountModel(
        code: code ?? this.code,
        profileDetails: profileDetails ?? this.profileDetails,
        characterId: characterId ?? this.characterId,
        transaction: transaction ?? this.transaction,
        orders: orders ?? this.orders,
        withdrawals: withdrawals ?? this.withdrawals,
      );

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        code: json["Code"] == null ? null : json["Code"],
        profileDetails: json["Profile_details"] == null
            ? null
            : ProfileDetails.fromJson(json["Profile_details"]),
        characterId: json["Character_id"] == null
            ? null
            : List<CharacterId>.from(
                json["Character_id"].map((x) => CharacterId.fromJson(x))),
        transaction: json["Transaction"] == null
            ? null
            : List<Transaction>.from(
                json["Transaction"].map((x) => Transaction.fromJson(x))),
        orders: json["Orders"] == null
            ? null
            : List<Order>.from(json["Orders"].map((x) => Order.fromJson(x))),
        withdrawals: json["Withdrawals"] == null
            ? null
            : List<Withdrawal>.from(
                json["Withdrawals"].map((x) => Withdrawal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Profile_details":
            profileDetails == null ? null : profileDetails.toJson(),
        "Character_id": characterId == null
            ? null
            : List<dynamic>.from(characterId.map((x) => x.toJson())),
        "Transaction": transaction == null
            ? null
            : List<dynamic>.from(transaction.map((x) => x.toJson())),
        "Orders": orders == null
            ? null
            : List<dynamic>.from(orders.map((x) => x.toJson())),
        "Withdrawals": withdrawals == null
            ? null
            : List<dynamic>.from(withdrawals.map((x) => x.toJson())),
      };
}

class CharacterId {
  CharacterId({
    this.gameId,
    this.gameName,
    this.characterId,
  });

  int gameId;
  String gameName;
  String characterId;

  CharacterId copyWith({
    int gameId,
    String gameName,
    String characterId,
  }) =>
      CharacterId(
        gameId: gameId ?? this.gameId,
        gameName: gameName ?? this.gameName,
        characterId: characterId ?? this.characterId,
      );

  factory CharacterId.fromJson(Map<String, dynamic> json) => CharacterId(
        gameId: json["game_id"] == null ? null : json["game_id"],
        gameName: json["game_name"] == null ? null : json["game_name"],
        characterId: json["Character_id"] == null ? null : json["Character_id"],
      );

  Map<String, dynamic> toJson() => {
        "game_id": gameId == null ? null : gameId,
        "game_name": gameName == null ? null : gameName,
        "Character_id": characterId == null ? null : characterId,
      };
}

class Order {
  Order({
    this.id,
    this.orderedProducts,
    this.subTotal,
    this.shippingFee,
    this.total,
    this.name,
    this.email,
    this.phoneNo,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.orderNote,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  List<OrderedProduct> orderedProducts;
  String subTotal;
  String shippingFee;
  String total;
  String name;
  String email;
  String phoneNo;
  String address;
  String city;
  String country;
  String postalCode;
  String orderNote;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Order copyWith({
    int id,
    List<OrderedProduct> orderedProducts,
    String subTotal,
    String shippingFee,
    String total,
    String name,
    String email,
    String phoneNo,
    String address,
    String city,
    String country,
    String postalCode,
    String orderNote,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Order(
        id: id ?? this.id,
        orderedProducts: orderedProducts ?? this.orderedProducts,
        subTotal: subTotal ?? this.subTotal,
        shippingFee: shippingFee ?? this.shippingFee,
        total: total ?? this.total,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        address: address ?? this.address,
        city: city ?? this.city,
        country: country ?? this.country,
        postalCode: postalCode ?? this.postalCode,
        orderNote: orderNote ?? this.orderNote,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        orderedProducts: json["Ordered_Products"] == null
            ? null
            : List<OrderedProduct>.from(json["Ordered_Products"]
                .map((x) => OrderedProduct.fromJson(x))),
        subTotal: json["sub_total"] == null ? null : json["sub_total"],
        shippingFee: json["Shipping_fee"] == null ? null : json["Shipping_fee"],
        total: json["Total"] == null ? null : json["Total"],
        name: json["Name"] == null ? null : json["Name"],
        email: json["Email"] == null ? null : json["Email"],
        phoneNo: json["Phone_no"] == null ? null : json["Phone_no"],
        address: json["address"] == null ? null : json["address"],
        city: json["city"] == null ? null : json["city"],
        country: json["country"] == null ? null : json["country"],
        postalCode: json["postal_code"] == null ? null : json["postal_code"],
        orderNote: json["order_note"] == null ? null : json["order_note"],
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
        "Ordered_Products": orderedProducts == null
            ? null
            : List<dynamic>.from(orderedProducts.map((x) => x.toJson())),
        "sub_total": subTotal == null ? null : subTotal,
        "Shipping_fee": shippingFee == null ? null : shippingFee,
        "Total": total == null ? null : total,
        "Name": name == null ? null : name,
        "Email": email == null ? null : email,
        "Phone_no": phoneNo == null ? null : phoneNo,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "country": country == null ? null : country,
        "postal_code": postalCode == null ? null : postalCode,
        "order_note": orderNote == null ? null : orderNote,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class OrderedProduct {
  OrderedProduct({
    this.id,
    this.name,
    this.image,
    this.price,
    this.currency,
    this.orderedQuantity,
    this.shortDescription,
    this.longDescription,
  });

  int id;
  String name;
  List<String> image;
  String price;
  String currency;
  String orderedQuantity;
  String shortDescription;
  String longDescription;

  OrderedProduct copyWith({
    int id,
    String name,
    List<String> image,
    String price,
    String currency,
    String orderedQuantity,
    String shortDescription,
    String longDescription,
  }) =>
      OrderedProduct(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        currency: currency ?? this.currency,
        orderedQuantity: orderedQuantity ?? this.orderedQuantity,
        shortDescription: shortDescription ?? this.shortDescription,
        longDescription: longDescription ?? this.longDescription,
      );

  factory OrderedProduct.fromJson(Map<String, dynamic> json) => OrderedProduct(
        id: json["id"] == null ? null : json["id"],
        name: json["Name"] == null ? null : json["Name"],
        image: json["Image"] == null
            ? null
            : List<String>.from(json["Image"].map((x) => x)),
        price: json["Price"] == null ? null : json["Price"],
        currency: json["Currency"] == null ? null : json["Currency"],
        orderedQuantity:
            json["ordered_Quantity"] == null ? null : json["ordered_Quantity"],
        shortDescription: json["Short_description"] == null
            ? null
            : json["Short_description"],
        longDescription:
            json["long_description"] == null ? null : json["long_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "Name": name == null ? null : name,
        "Image": image == null ? null : List<dynamic>.from(image.map((x) => x)),
        "Price": price == null ? null : price,
        "Currency": currency == null ? null : currency,
        "ordered_Quantity": orderedQuantity == null ? null : orderedQuantity,
        "Short_description": shortDescription == null ? null : shortDescription,
        "long_description": longDescription == null ? null : longDescription,
      };
}

class ProfileDetails {
  ProfileDetails({
    this.photo,
    this.name,
    this.mobileNo,
    this.gender,
    this.balance,
    this.earning,
    this.coinDeposit,
    this.withdrawCoins,
  });

  String photo;
  String name;
  String mobileNo;
  String gender;
  String balance;
  String earning;
  int coinDeposit;
  int withdrawCoins;

  ProfileDetails copyWith({
    String photo,
    String name,
    String mobileNo,
    String gender,
    String balance,
    String earning,
    int coinDeposit,
    int withdrawCoins,
  }) =>
      ProfileDetails(
        photo: photo ?? this.photo,
        name: name ?? this.name,
        mobileNo: mobileNo ?? this.mobileNo,
        gender: gender ?? this.gender,
        balance: balance ?? this.balance,
        earning: earning ?? this.earning,
        coinDeposit: coinDeposit ?? this.coinDeposit,
        withdrawCoins: withdrawCoins ?? this.withdrawCoins,
      );

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
        photo: json["photo"] == null ? null : json["photo"],
        name: json["name"] == null ? null : json["name"],
        mobileNo: json["mobile_no"] == null ? null : json["mobile_no"],
        gender: json["gender"] == null ? null : json["gender"],
        balance: json["balance"] == null ? null : json["balance"],
        earning: json["earning"] == null ? null : json["earning"],
        coinDeposit: json["coin_deposit"] == null ? null : json["coin_deposit"],
        withdrawCoins:
            json["withdraw_coins"] == null ? null : json["withdraw_coins"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo == null ? null : photo,
        "name": name == null ? null : name,
        "mobile_no": mobileNo == null ? null : mobileNo,
        "gender": gender == null ? null : gender,
        "balance": balance == null ? null : balance,
        "earning": earning == null ? null : earning,
        "coin_deposit": coinDeposit == null ? null : coinDeposit,
        "withdraw_coins": withdrawCoins == null ? null : withdrawCoins,
      };
}

class Transaction {
  Transaction({
    this.id,
    this.amount,
    this.message,
    this.cnicNo,
    this.accountNo,
    this.phoneNo,
    this.paymentMethod,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String amount;
  String message;
  String cnicNo;
  String accountNo;
  String phoneNo;
  String paymentMethod;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Transaction copyWith({
    int id,
    String amount,
    String message,
    String cnicNo,
    String accountNo,
    String phoneNo,
    String paymentMethod,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Transaction(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        message: message ?? this.message,
        cnicNo: cnicNo ?? this.cnicNo,
        accountNo: accountNo ?? this.accountNo,
        phoneNo: phoneNo ?? this.phoneNo,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"] == null ? null : json["id"],
        amount: json["amount"] == null ? null : json["amount"],
        message: json["message"] == null ? null : json["message"],
        cnicNo: json["cnic_no"] == null ? null : json["cnic_no"],
        accountNo: json["account_no"] == null ? null : json["account_no"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
        paymentMethod:
            json["payment_method"] == null ? null : json["payment_method"],
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
        "amount": amount == null ? null : amount,
        "message": message == null ? null : message,
        "cnic_no": cnicNo == null ? null : cnicNo,
        "account_no": accountNo == null ? null : accountNo,
        "phone_no": phoneNo == null ? null : phoneNo,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}

class Withdrawal {
  Withdrawal({
    this.id,
    this.paymentMethod,
    this.amount,
    this.name,
    this.email,
    this.phoneNo,
    this.cnicNo,
    this.note,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String paymentMethod;
  String amount;
  String name;
  String email;
  String phoneNo;
  String cnicNo;
  String note;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Withdrawal copyWith({
    int id,
    String paymentMethod,
    String amount,
    String name,
    String email,
    String phoneNo,
    String cnicNo,
    String note,
    String status,
    DateTime createdAt,
    DateTime updatedAt,
  }) =>
      Withdrawal(
        id: id ?? this.id,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        amount: amount ?? this.amount,
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        cnicNo: cnicNo ?? this.cnicNo,
        note: note ?? this.note,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Withdrawal.fromJson(Map<String, dynamic> json) => Withdrawal(
        id: json["id"] == null ? null : json["id"],
        paymentMethod:
            json["payment_method"] == null ? null : json["payment_method"],
        amount: json["amount"] == null ? null : json["amount"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        phoneNo: json["phone_no"] == null ? null : json["phone_no"],
        cnicNo: json["cnic_no"] == null ? null : json["cnic_no"],
        note: json["note"] == null ? null : json["note"],
        status: json["Status"] == null ? null : json["Status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "amount": amount == null ? null : amount,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "phone_no": phoneNo == null ? null : phoneNo,
        "cnic_no": cnicNo == null ? null : cnicNo,
        "note": note == null ? null : note,
        "Status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
