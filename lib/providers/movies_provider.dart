import 'dart:developer' as dv;
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/cartoon_model.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/models/serie_model.dart';

class MoviesProvider with ChangeNotifier {
  CollectionReference allMovies = Firestore.instance.collection('movies');
  CollectionReference allSeries = Firestore.instance.collection('series');
  CollectionReference allCartoons = Firestore.instance.collection('cartoons');

  final List<MovieModel> _movies = [];
  final List<SerieModel> _series = [];
  final List<CartoonModel> _cartoons = [];

  List<MovieModel> get movies => _movies;

  List<SerieModel> get series => _series;

  List<CartoonModel> get cartoons => _cartoons;

  void getAllMovies() async {
    final result = await allMovies.orderBy("movie").get();
    for (var item in result) {
      MovieModel movie = MovieModel(
        id: item.id,
        name: item.map['movie']['name'],
        year: item.map['movie']['year'],
        rating: item.map['movie']['rating'],
        title: item.map['movie']['title'],
        imgUrl: item.map['movie']['imgUrl'],
        videoUrl: item.map['movie']['videoUrl'],
        path: "",
      );
      _movies.add(movie);

    }
    dv.log("All movies: ${_movies.length}");
  }

  void getAllSeries() async {
    final result = await allSeries.orderBy("serie").get();
    for (var item in result) {
      var serie = SerieModel.fromJson(item.map['serie']);
      _series.add(serie);
      dv.log("All series: ${_series.length}");
    }
  }

  void getAllCartoons() async {
    final result = await allCartoons.orderBy("cartoon").get();
    for (var item in result) {
      var carton = CartoonModel.fromJson(item.map['cartoon']);
      _cartoons.add(carton);
      dv.log("All cartoons: ${_series.length}");
    }
  }
}
