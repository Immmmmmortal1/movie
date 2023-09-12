import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie/dioservice/http_dio_service.dart';

class ApiService {

 static Future<int?> fetchMovieRuntime(int movieId) async {
    const String apiKey = 'fd10bbeb5c19457485e61cb462e882b4';
    try {
      final response = await dio.get(
          '/3/movie/$movieId?api_key=$apiKey&append_to_response=runtime'); // API'den film bilgileri alındı

      if (response.statusCode == HttpStatus.ok) {
        return response.data['runtime']; // Film süresi döndürüldü
      } else {
        return null; // İstek başarısızsa null döndürüldü
      }
    } catch (e) {
      return null; // Hata durumunda null döndürüldü
    }
  }
 static Future<Response> searchMovies(String query) async {
    const String apiKey = 'fd10bbeb5c19457485e61cb462e882b4';
    try {
      final response = await dio.get(
        '/3/search/movie?api_key=$apiKey&query=${Uri.encodeComponent(query)}',
      );
      return response;
    } catch (e) {
      throw Exception('Film arama isteği başarısız: $e');
    }
  }
   // Belirtilen TV dizisi ID'si için dizi süresini getiren fonksiyon
 static  Future<int?> fetchTvShowRuntime(int tvShowId) async {
    const String apiKey = 'fd10bbeb5c19457485e61cb462e882b4';
    try {
      final response = await dio.get(
          '/3/tv/$tvShowId?api_key=$apiKey&append_to_response=runtime'); // API'den dizi bilgileri alındı

      if (response.statusCode == HttpStatus.ok) {
        return response.data['episode_run_time'][0]; // Dizi süresi döndürüldü
      } else {
        return null; // İstek başarısızsa null döndürüldü
      }
    } catch (e) {
      return null; // Hata durumunda null döndürüldü
    }
  }
  // Film ve TV dizileri için oyuncu kadrosunu getiren fonksiyon
  Future<List<Map<String, dynamic>>?> fetchCast(
      int movieId, int tvShowId) async {
    const String apiKey = 'fd10bbeb5c19457485e61cb462e882b4';
    try {
      Response response;
      // ignore: unnecessary_null_comparison
      if (movieId != null) {
        response = await dio.get(
          '/3/movie/$movieId/credits?api_key=$apiKey',
        ); // Film oyuncu kadrosu alındı
        // ignore: unnecessary_null_comparison
      } else if (tvShowId != null) {
        response = await dio.get(
          '/3/tv/$tvShowId/credits?api_key=$apiKey',
        ); // Dizi oyuncu kadrosu alındı
      } else {
        return null; // Hem film hem de dizi ID'si yoksa null döndürüldü
      }

      if (response.statusCode == HttpStatus.ok) {
        List<Map<String, dynamic>> castList = List<Map<String, dynamic>>.from(
            response.data['cast']); // Oyuncu kadrosu çıkarıldı
        return castList; // Oyuncu kadrosu döndürüldü
      } else {
        return null; // İstek başarısızsa null döndürüldü
      }
    } catch (e) {
      return null; // Hata durumunda null döndürüldü
    }
  }
  // Belirtilen URL için HTTP GET isteği yapan fonksiyon
 static Future<Response> get(String url) async {
    try {
      final response = await dio.get(url); // Belirtilen URL'den veri alındı
      return response; // Yanıt döndürüldü
    } catch (e) {
      throw Exception(
          'API isteği başarısız: $e'); // Hata durumunda istisna fırlatıldı
    }
  }
}