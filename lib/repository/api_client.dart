import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/homepage_model.dart';
import '../models/shoppage_model.dart';
import '../models/tournaments_model.dart';

class ApiClient {
  ApiClient() {
    var tokenOptions = BaseOptions(
        receiveTimeout: 10000,
        connectTimeout: 10000,
        baseUrl:
            "https://evorgaming.com/qpp/congrunf/bvnd/gdjdh/hdvdnj/dbdbdjh/nbvdbd/Register/bbdh/mobile/",
        contentType: Headers.formUrlEncodedContentType);
    _dio = Dio(tokenOptions);
  }

  Dio _dio;

  Future<dynamic> login(String email, String password) async {
    final uriResponse = await _dio.post('App/Login/User', data: {
      "email": email,
      "password": password,
    });
    if (uriResponse.statusCode == 200) {
      return HomePageModel.fromJson(json.decode(uriResponse.data));
    } else {
      throw Exception('Unexpected Error Occurred');
    }
  }

  Future<dynamic> register(Map<String, dynamic> data) async {
    final uriResponse = await _dio.post('App/Register/User', data: data);
    if (uriResponse.statusCode == 200) {
      return HomePageModel.fromJson(json.decode(uriResponse.data));
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
}
