import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.code,
    this.message,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        code: json["Code"] == null ? null : json["Code"],
        message: json["Message"] == null
            ? null
            : List<Message>.from(
                json["Message"].map((x) => Message.fromJson(x))),
      );

  String code;
  List<Message> message;

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Message": message == null
            ? null
            : List<dynamic>.from(message.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    this.productId,
    this.name,
    this.images,
    this.price,
    this.currency,
    this.quantityInStock,
    this.shortDescription,
    this.longDescription,
    this.status,
    this.qty,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        productId: json["product_id"] == null ? null : json["product_id"],
        name: json["Name"] == null ? null : json["Name"],
        images: json["Images"] == null ? null : json["Images"],
        price: json["Price"] == null ? null : json["Price"],
        currency: json["Currency"] == null ? null : json["Currency"],
        quantityInStock: json["Quantity_in_stock"] == null
            ? null
            : json["Quantity_in_stock"],
        shortDescription: json["Short_description"] == null
            ? null
            : json["Short_description"],
        longDescription:
            json["long_description"] == null ? null : json["long_description"],
        status: json["status"] == null ? null : json["status"],
        qty: json["qty"] == null ? null : json["qty"],
      );

  String currency;
  String images;
  String longDescription;
  String name;
  String price;
  String productId;
  String qty;
  String quantityInStock;
  String shortDescription;
  String status;

  Map<String, dynamic> toJson() => {
        "product_id": productId == null ? null : productId,
        "Name": name == null ? null : name,
        "Images": images == null ? null : images,
        "Price": price == null ? null : price,
        "Currency": currency == null ? null : currency,
        "Quantity_in_stock": quantityInStock == null ? null : quantityInStock,
        "Short_description": shortDescription == null ? null : shortDescription,
        "long_description": longDescription == null ? null : longDescription,
        "status": status == null ? null : status,
        "qty": qty == null ? null : qty,
      };
}
