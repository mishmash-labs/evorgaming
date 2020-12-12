import 'package:dio/dio.dart';
import 'package:evorgaming/models/homepage_model.dart';
import 'package:evorgaming/models/shoppage_model.dart';
import 'package:evorgaming/models/tournaments_model.dart';
import 'dart:convert';

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
