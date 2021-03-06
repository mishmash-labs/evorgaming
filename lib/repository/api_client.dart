import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../models/mytournaments_model.dart';

import '../models/account_model.dart';
import '../models/cartpage_model.dart';
import '../models/genericmessage_model.dart';
import '../models/homepage_model.dart';
import '../models/paymentmethods_model.dart';
import '../models/shoppage_model.dart';
import '../models/tournaments_model.dart';

class ApiClient {
  ApiClient() {
    var tokenOptions = BaseOptions(
      receiveTimeout: 10000,
      connectTimeout: 10000,
      baseUrl:
          "https://evorgaming.com/qpp/congrunf/bvnd/gdjdh/hdvdnj/dbdbdjh/nbvdbd/Register/bbdh/mobile/",
      contentType: Headers.formUrlEncodedContentType,
    );
    _dio = Dio(tokenOptions);
  }

  Dio _dio;

  Future<dynamic> login(String email, String password) async {
    final uriResponse = await _dio.post('App/Login/User', data: {
      "email": email,
      "password": password,
    });
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    final uriResponse = await _dio.post('App/Register/User', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> homepage(String email) async {
    final uriResponse = await _dio.post('app/home/screen/frame', data: {
      "email": email,
    });
    if (uriResponse.statusCode == 200) {
      return HomePageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> shoppage(String email) async {
    final uriResponse = await _dio.post('app/shop/frame/all', data: {
      "email": email,
    });
    if (uriResponse.statusCode == 200) {
      return ShopModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> tournamentpage(String email, int gameid) async {
    final uriResponse =
        await _dio.post('app/game/frame/specific/game/id', data: {
      "email": email,
      "game_id": gameid,
    });
    if (uriResponse.statusCode == 200) {
      return TournamentPageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> accountpage(String email) async {
    final uriResponse = await _dio.post('app/user/profile/details', data: {
      "email": email,
    });
    if (uriResponse.statusCode == 200) {
      return AccountModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> updateprofile(Map<String, dynamic> data) async {
    final uriResponse =
        await _dio.post('app/user/profile/details/update/details', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> profileimage(
      String email, String filePath, String fileName, Uint8List webFile) async {
    var formData;
    if (!kIsWeb)
      formData = FormData.fromMap({
        "email": email,
        "image": await MultipartFile.fromFile(filePath, filename: fileName)
      });
    else
      formData = FormData.fromMap({
        "email": email,
        "image": await MultipartFile.fromBytes(webFile, filename: fileName)
      });
    final uriResponse = await _dio.post(
      'app/user/profile/details/update/image',
      data: formData,
    );
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(uriResponse.data);
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> addtocart(
      String email, int userID, int productID, int qty) async {
    final uriResponse = await _dio.post('app/shop/add/to/cart', data: {
      "email": email,
      "user_id": userID,
      "product_id": productID,
      "qty": qty,
    });
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> viewcart(String email) async {
    final uriResponse = await _dio.post('app/shop/cart/view', data: {
      "email": email,
    });
    if (uriResponse.statusCode == 200) {
      return CartModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> deletefromcart(String email, String productID) async {
    final uriResponse =
        await _dio.post('app/shop/delete/product/from/cart', data: {
      "email": email,
      "product_id": productID,
    });
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> updateitemquantity(
      String email, String productID, String quantity) async {
    final uriResponse = await _dio.post('app/shop/update/cart', data: {
      "email": email,
      "product_id": productID,
      "new_quantity": quantity,
    });
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> getpaymentmethods(String email) async {
    final uriResponse = await _dio.post('app/payment/methods', data: {
      "email": email,
    });
    if (uriResponse.statusCode == 200) {
      return PaymentMethodsModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> submitwithdrawlrequest(Map<String, dynamic> data) async {
    final uriResponse =
        await _dio.post('app/payment/make/withdraw', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> checkout(Map<String, dynamic> data) async {
    final uriResponse = await _dio.post('app/shop/checkout', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> addcharacterid(Map<String, dynamic> data) async {
    final uriResponse = await _dio
        .post('app/user/profile/details/update/add/Character/id', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> changepassword(Map<String, dynamic> data) async {
    final uriResponse =
        await _dio.post('app/user/profile/details/update/password', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> joinsolotournament(Map<String, dynamic> data) async {
    final uriResponse =
        await _dio.post('app/tournments/join/solo/tournment', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> joinduotournament(Map<String, dynamic> data) async {
    final uriResponse =
        await _dio.post('app/tournments/join/duo/tournment', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> joinsquadtournament(Map<String, dynamic> data) async {
    final uriResponse =
        await _dio.post('app/tournments/join/squad/tournment', data: data);
    if (uriResponse.statusCode == 200) {
      return GenericMessageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> mytournaments(String email) async {
    final uriResponse = await _dio.post('app/MyTournment/screen/frame', data: {
      "email": email,
    });
    if (uriResponse.statusCode == 200) {
      return MyTournamentPageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }
}
