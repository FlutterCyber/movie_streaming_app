import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/movie_model.dart';

class Downloader with ChangeNotifier {
  List<MovieModel> downloaded = [];
  List<MovieModel> downloading = [];

  List<MovieModel> get downloadedMovies => downloaded;

  List<MovieModel> get downloadingMovies => downloading;


  void addToDownloading (MovieModel model){
    downloading.add(model);
  }

  void removeFromDownloading (MovieModel model){
    downloading.remove(model);
  }

  void addDownloaded (MovieModel model){
    downloaded.add(model);
  }

  void removeFromDownloaded (MovieModel model){
    downloaded.remove(model);
  }

}
