
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';
import 'package:movie/dioservice/http_dio_service.dart';
import 'package:shared_preferences/shared_preferences.dart'; // SharedPreferences'ı ekleyin

class CreateRequestToken {
  /// the variable `dio`. The `Dio` class is typically used for making HTTP requests in Dart.
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org'; // API temel URL'i

  Future<String?> getRequestToken() async {
    const String apiKey = 'fd10bbeb5c19457485e61cb462e882b4';

    try {
      final response = await dio.get("/3/authentication/token/new",queryParameters: {'api_key': apiKey});
      if (response.statusCode == HttpStatus.ok) {
      final Map<String, dynamic> data = response.data;
      final String requestToken = data['request_token'];

      await saveRequestToken(requestToken);

      return requestToken;
    }else{
      if (kDebugMode) {
         print('Request Token oluşmadı. Status Code: ${response.statusCode}');
      }
        return null;
    }
    }catch (e) {
       if (kDebugMode) {
        print('Hata oluştu: $e');
      }
        return null;
    }
    

  }
  // Request token'ı saklamak için kullanılacak fonksiyon
  Future<void> saveRequestToken(String requestToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('request_token', requestToken);
  }
}