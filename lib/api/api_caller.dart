import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCaller {
  String apiKey = '26bbfd01360f5d6e348f854015a276072216b1a5';
  String baseUrl = 'https://api.waqi.info/feed';
  static final _dio = Dio(BaseOptions(responseType: ResponseType.plain));

  Future<String> get(String endpoint, {Map<String, dynamic>? params}) async {
    try {
      final response = await _dio.get('$baseUrl/$endpoint/?token=$apiKey');
      debugPrint('Status code: ${response.statusCode}');
      // debugPrint(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      var msg = e.response?.data.toString();
      // debugPrint(msg);
      throw Exception(msg);
    } catch (e) {
      // debugPrint(e.toString());
      rethrow;
    }
  }
}
