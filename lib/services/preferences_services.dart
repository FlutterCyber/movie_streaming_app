import 'dart:convert';
import 'dart:io';

import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preference {

  static Future<bool> saveMovie(MovieModel movie) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> savedMovies = [];
    try {
      List<String>? tempList = preferences.getStringList("movies");
      for (var item in tempList!) {
        savedMovies.add(item);
      }
      savedMovies.add(jsonEncode(MovieModel.toMap(movie)));
      return preferences.setStringList("movies", savedMovies);
    } catch (e) {
      savedMovies.add(jsonEncode(MovieModel.toMap(movie)));
      return preferences.setStringList("movies", savedMovies);
    }
  }

  static Future<bool> deleteMovie(MovieModel movie) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> savedMovies = [];
    try {
      List<String>? tempList = preferences.getStringList("movies");
      for (var item in tempList!) {
        var tMov = MovieModel.fromJson(jsonDecode(item));

        if (movie.id != tMov.id) {
          savedMovies.add(item);
        }
        if (await File(movie.path).exists()) {
          await  File(movie.path).delete();
        }
      }
      return preferences.setStringList("movies", savedMovies);
    } catch (e) {
      return preferences.setStringList("movies", savedMovies);
    }
  }
}
