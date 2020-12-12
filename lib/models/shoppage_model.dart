import 'dart:convert';

ShopModel shopModelFromJson(String str) => ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel data) => json.encode(data.toJson());

class ShopModel {
  ShopModel({
    this.code,
    this.products,
  });

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        code: json["Code"] == null ? null : json["Code"],
        products: json["Products"] == null
            ? null
            : List<Product>.from(
                json["Products"].map((x) => Product.fromJson(x))),
      );

  String code;
  List<Product> products;

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.image,
    this.price,
    this.currency,
    this.quantity,
    this.shortDescription,
    this.longDescription,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] == null ? null : json["id"],
        name: json["Name"] == null ? null : json["Name"],
        image: json["Image"] == null
            ? null
            : List<String>.from(json["Image"].map((x) => x)),
        price: json["Price"] == null ? null : json["Price"],
        currency: json["Currency"] == null ? null : json["Currency"],
        quantity: json["Quantity"] == null ? null : json["Quantity"],
        shortDescription: json["Short_description"] == null
            ? null
            : json["Short_description"],
        longDescription:
            json["long_description"] == null ? null : json["long_description"],
      );

  String currency;
  int id;
  List<String> image;
  String longDescription;
  String name;
  String price;
  String quantity;
  String shortDescription;

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "Name": name == null ? null : name,
        "Image": image == null ? null : List<dynamic>.from(image.map((x) => x)),
        "Price": price == null ? null : price,
        "Currency": currency == null ? null : currency,
        "Quantity": quantity == null ? null : quantity,
        "Short_description": shortDescription == null ? null : shortDescription,
        "long_description": longDescription == null ? null : longDescription,
      };
}
