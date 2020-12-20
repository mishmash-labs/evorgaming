// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

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
  });

  String code;
  ProfileDetails profileDetails;
  List<CharacterId> characterId;
  List<Transaction> transaction;
  List<Order> orders;

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
        orders: json["orders"] == null
            ? null
            : List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
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
        "orders": orders == null
            ? null
            : List<dynamic>.from(orders.map((x) => x.toJson())),
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
    this.userId,
    this.productId,
    this.qty,
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
    this.reviewStatus,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String productId;
  String qty;
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
  String reviewStatus;
  DateTime createdAt;
  DateTime updatedAt;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        productId: json["product_id"] == null ? null : json["product_id"],
        qty: json["qty"] == null ? null : json["qty"],
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
        reviewStatus:
            json["review_status"] == null ? null : json["review_status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "product_id": productId == null ? null : productId,
        "qty": qty == null ? null : qty,
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
        "review_status": reviewStatus == null ? null : reviewStatus,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
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
    this.userId,
    this.amount,
    this.message,
    this.statusCode,
    this.cnicNo,
    this.accountNo,
    this.phoneNo,
    this.paymentMethod,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String userId;
  String amount;
  String message;
  String statusCode;
  String cnicNo;
  String accountNo;
  String phoneNo;
  String paymentMethod;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        amount: json["amount"] == null ? null : json["amount"],
        message: json["message"] == null ? null : json["message"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
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
        "user_id": userId == null ? null : userId,
        "amount": amount == null ? null : amount,
        "message": message == null ? null : message,
        "status_code": statusCode == null ? null : statusCode,
        "cnic_no": cnicNo == null ? null : cnicNo,
        "account_no": accountNo == null ? null : accountNo,
        "phone_no": phoneNo == null ? null : phoneNo,
        "payment_method": paymentMethod == null ? null : paymentMethod,
        "status": status == null ? null : status,
        "created_at": createdAt == null ? null : createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}
