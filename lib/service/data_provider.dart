import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:movie/models/credit_model.dart';
import 'package:movie/models/gneres_model.dart';

import 'package:movie/models/movie_api_model.dart';
import 'package:movie/models/tv_tending_model.dart';
import 'package:movie/service/app_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider with ChangeNotifier {

  List<MovieModel>? _movieItem;
  List<GenresModel>? _genresItem;
  List<TvTrending>? _tvTrendingItem;
  bool _isLoading = true;
  bool _isDataFetched = false;
  late SharedPreferences _preferences;

  bool get isLoading => _isLoading;
  List<MovieModel>? get movieItem => _movieItem;
  List<GenresModel>? get genresItem => _genresItem;
  List<TvTrending>? get tvTrendingItem => _tvTrendingItem;
  List<String> wishlist = [];

  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
    List<String>? storedWishlist = _preferences.getStringList('wishlist');
    if (storedWishlist != null) {
      wishlist = storedWishlist;
    }
  }
  DataProvider() {
    initPreferences();
  }
  void addMovieToWishlist(String? movieTitle, String? posterPath) {
    if (movieTitle != null && posterPath != null) {
      String combinedData = '$movieTitle|$posterPath';
      wishlist.add(combinedData);

      _preferences.setStringList('wishlist', wishlist);

      notifyListeners();
    }
  }
  void removeFromWishlist(int index) {
    if (index >= 0 && index < wishlist.length) {
      wishlist.removeAt(index);
      _preferences.setStringList('wishlist', wishlist);
      notifyListeners();
    }
  }
  Future<void> fetchData() async {
    if (_isDataFetched) {
      return;
    }

    const String apikey = 'fd10bbeb5c19457485e61cb462e882b4';
    try {
      final movieResponse =
          await ApiService.get('/3/discover/movie?api_key=$apikey');
      final genresResponse =
          await ApiService.get('/3/genre/movie/list?api_key=$apikey');
      final tvTrendingResponse =
          await ApiService.get('/3/trending/tv/day?api_key=$apikey');

      if (movieResponse.statusCode == HttpStatus.ok &&
          genresResponse.statusCode == HttpStatus.ok &&
          tvTrendingResponse.statusCode == HttpStatus.ok) {
        _movieItem = await MovieProcessor.processMovies(movieResponse.data);
        _genresItem = (genresResponse.data['genres'] as List<dynamic>)
            .map<GenresModel>((item) => GenresModel.fromJson(item))
            .toList();
        _tvTrendingItem =
            await TvProcessor.processTvShows(tvTrendingResponse.data);

        _isDataFetched = true;
      } else {
        if (kDebugMode) {
          print('Film veya türler verisi alınamadı');
        }
      }

      _changeLoading(false);
    } catch (e) {
      if (kDebugMode) {
        print('Hata oluştu: $e');
      }

      _changeLoading(false);
    }
  }
  void _changeLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  
}

class MovieProcessor {

  static Future<List<MovieModel>> processMovies(
      Map<String, dynamic> movieResponse) async {
    final List<dynamic> movieResults = movieResponse['results'];
    List<MovieModel> movieList = [];

    for (var item in movieResults) {
      final MovieModel movie = MovieModel.fromJson(item);

      final runtime = await ApiService.fetchMovieRuntime(movie.id!);
      movie.runtime = runtime;

      movieList.add(movie);
    }

    return movieList;
  }
}
class TvProcessor {

  static Future<List<TvTrending>> processTvShows(
      Map<String, dynamic> tvTrendingResponse) async {
    final List<dynamic> tvTrendingResult = tvTrendingResponse['results'];
    List<TvTrending> tvTrendingList =
        tvTrendingResult.map((item) => TvTrending.fromJson(item)).toList();

    for (var tvShow in tvTrendingList) {
      final runtime = await ApiService.fetchTvShowRuntime(tvShow.id!);
      tvShow.runtime = runtime;

      final credits = await CreditProcessor.fetchTvShowCredits(tvShow.id!);
      tvShow.credits = credits;
    }

    return tvTrendingList;
  }
}
class CreditProcessor {

  static Future<List<CreditModel>> fetchMovieCredits(int movieId) async {
    try {
      final response = await ApiService.get(
          'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=fd10bbeb5c19457485e61cb462e882b4');

      if (response.statusCode == 200) {
        final List<dynamic> creditsData = response.data['cast'];
        return creditsData
            .map((credit) => CreditModel.fromJson(credit))
            .toList();
      } else {
        throw Exception('Failed to fetch movie credits.');
      }
    } catch (e) {
      throw Exception('Failed to fetch movie credits: $e');
    }
  }

 static Future<List<CreditModel>> fetchTvShowCredits(int tvShowId) async {
    try {
      final response = await ApiService.get(
          'https://api.themoviedb.org/3/tv/$tvShowId/credits?api_key=fd10bbeb5c19457485e61cb462e882b4');

      if (response.statusCode == 200) {
        final List<dynamic> creditsData = response.data['cast'];
        return creditsData
            .map((credit) => CreditModel.fromJson(credit))
            .toList();
      } else {
        throw Exception('Failed to fetch TV show credits.');
      }
    } catch (e) {
      throw Exception('Failed to fetch TV show credits: $e');
    }
  }
}