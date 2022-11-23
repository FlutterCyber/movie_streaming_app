import 'dart:convert';

class MovieModel {
  String id;
  String name;
  int year;
  double rating;
  String title;
  String imgUrl;
  String path;

  MovieModel({
    required this.id,
    required this.name,
    required this.year,
    required this.rating,
    required this.title,
    required this.imgUrl,
    required this.path,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        year = json['year'],
        rating = json['rating'],
        title = json['title'],
        imgUrl = json['imgUrl'],
        path = json['path'];

  static toMap(MovieModel movie) => {
        "id": movie.id,
        "name": movie.name,
        "year": movie.year,
        "rating": movie.rating,
        "title": movie.title,
        "imgUrl": movie.imgUrl,
        "path": movie.path,
      };

  static String encode(List<MovieModel> movies) => json.encode(
        movies
            .map<Map<String, dynamic>>((movies) => MovieModel.toMap(movies))
            .toList(),
      );

  static List<MovieModel> decode(String movies) =>
      (json.decode(movies) as List<dynamic>)
          .map<MovieModel>((item) => MovieModel.fromJson(item))
          .toList();
}
