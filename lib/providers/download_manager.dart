// ignore_for_file: depend_on_referenced_packages, constant_identifier_names

import 'dart:collection';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';

class DownloadManager with ChangeNotifier {
  static final Dio dio = Dio();
  static final CancelToken cancelToken = CancelToken();
  static const MOVIE_FOLDER = 'movies';

  DownloadManager._();

  static DownloadManager? _instance;

  static DownloadManager get instance => _instance ??= DownloadManager._();

  List<MovieModel> get movies => _downloadingMovies;

  final List<MovieModel> _downloadingMovies = [];

  final HashMap<String, BehaviorSubject<double>> _movieProgress = HashMap();
  BehaviorSubject<int> onUpdate = BehaviorSubject();

  Stream<double>? getMovieDownloadProgress(MovieModel movie) =>
      _movieProgress[movie.id];

  Future<Directory> _getMovieDirectory() async {
    log("Directory initialized");
    Directory movieDirectory =
        Directory(join((await getTemporaryDirectory()).path, MOVIE_FOLDER));
    movieDirectory.createSync();
    return movieDirectory;
  }

  // void removeMovie(MovieModel movie) {
  //   var id = movie.id;
  //   for (var mov in movies) {
  //     if (id == mov.id) {
  //       _downloadingMovies.remove(movie);
  //     }
  //   }
  // }

  bool downloadMovie(MovieModel movie) {
    if (_downloadingMovies.contains(movie) || _downloadingMovies.length >= 4) {
      return false;
    }
    _download(movie);
    return true;
  }

  Future<void> _download(MovieModel movie) async {
    log('Downloading movie: ${movie.name}');
    Directory movieDirectory = await _getMovieDirectory();

    _downloadingMovies.add(movie);
    log('New movie added. movie count = ${_downloadingMovies.length}');
    onUpdate.add(math.Random().nextInt(100000));
    File movieFile = File(join(movieDirectory.path, movie.id));
    if (movieFile.existsSync()) {
      movieFile.deleteSync();
    }
    movieFile.createSync();

    _movieProgress[movie.id] = BehaviorSubject();
    dio.download(movie.videoUrl, movieFile.path, cancelToken: cancelToken,
        onReceiveProgress: (count, total) {
      _movieProgress[movie.id]?.add(count / total);
      log('Download in progress: ${movie.name}: ${count * 1.0 / total}');
      if (count + 1 >= total) {
        _movieProgress[movie.id]?.close();
        _movieProgress.remove(movie.id);
        _downloadingMovies.remove(movie);
      }
    });
  }

  Future<void> cancelDownloading(MovieModel movie) async {
    cancelToken.cancel();
    for (int i = 0; i < _downloadingMovies.length; i++) {
      if (_downloadingMovies[i].id == movie.id) {
        _downloadingMovies.removeAt(i);
      }
    }
  }
}
