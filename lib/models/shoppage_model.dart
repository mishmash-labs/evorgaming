// To parse this JSON data, do
//
//     final shopModel = shopModelFromJson(jsonString);

import 'dart:convert';

ShopModel shopModelFromJson(String str) => ShopModel.fromJson(json.decode(str));

String shopModelToJson(ShopModel data) => json.encode(data.toJson());

class ShopModel {
  ShopModel({
    this.code,
    this.products,
    this.cartTotalProducts,
  });

  String code;
  List<Product> products;
  int cartTotalProducts;

  ShopModel copyWith({
    String code,
    List<Product> products,
    int cartTotalProducts,
  }) =>
      ShopModel(
        code: code ?? this.code,
        products: products ?? this.products,
        cartTotalProducts: cartTotalProducts ?? this.cartTotalProducts,
      );

  factory ShopModel.fromJson(Map<String, dynamic> json) => ShopModel(
        code: json["Code"] == null ? null : json["Code"],
        products: json["Products"] == null
            ? null
            : List<Product>.from(
                json["Products"].map((x) => Product.fromJson(x))),
        cartTotalProducts: json["cart_total_products"] == null
            ? null
            : json["cart_total_products"],
      );

  Map<String, dynamic> toJson() => {
        "Code": code == null ? null : code,
        "Products": products == null
            ? null
            : List<dynamic>.from(products.map((x) => x.toJson())),
        "cart_total_products":
            cartTotalProducts == null ? null : cartTotalProducts,
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
    this.isAlreadyAddedToCart,
  });

  int id;
  String name;
  List<String> image;
  String price;
  String currency;
  String quantity;
  String shortDescription;
  String longDescription;
  int isAlreadyAddedToCart;

  Product copyWith({
    int id,
    String name,
    List<String> image,
    String price,
    String currency,
    String quantity,
    String shortDescription,
    String longDescription,
    int isAlreadyAddedToCart,
  }) =>
      Product(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        currency: currency ?? this.currency,
        quantity: quantity ?? this.quantity,
        shortDescription: shortDescription ?? this.shortDescription,
        longDescription: longDescription ?? this.longDescription,
        isAlreadyAddedToCart: isAlreadyAddedToCart ?? this.isAlreadyAddedToCart,
      );

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
        isAlreadyAddedToCart: json["is_already_added_to_cart"] == null
            ? null
            : json["is_already_added_to_cart"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "Name": name == null ? null : name,
        "Image": image == null ? null : List<dynamic>.from(image.map((x) => x)),
        "Price": price == null ? null : price,
        "Currency": currency == null ? null : currency,
        "Quantity": quantity == null ? null : quantity,
        "Short_description": shortDescription == null ? null : shortDescription,
        "long_description": longDescription == null ? null : longDescription,
        "is_already_added_to_cart":
            isAlreadyAddedToCart == null ? null : isAlreadyAddedToCart,
      };
}
