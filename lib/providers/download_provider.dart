import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/movie_model.dart';

class Downloader with ChangeNotifier {
  List<MovieModel> moviesList = [];

  List<MovieModel> get movies => moviesList;

  void removeMovie(MovieModel movie) {
    var id = movie.id;
    for (var mov in movies) {
      if (id == mov.id) {
        moviesList.remove(movie);
      }
    }
  }

  void addMovie(MovieModel movie) {
    moviesList.add(movie);
  }

//   ${context.watch<Counter>().count()   => view variable
// context.read<Counter>().increment(),
}
