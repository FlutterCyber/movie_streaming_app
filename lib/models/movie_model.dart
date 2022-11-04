class MovieModel {
  String name;
  int year;
  double rating;
  String title;
  String imgUrl;
  String videoUrl;
  bool isDrama;
  bool isFantastic;
  bool isComedic;
  bool isAction;
  bool isHorror;
  bool isThriller;

  MovieModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        year = json['year'],
        rating = json['rating'],
        imgUrl = json['imgUrl'],
        videoUrl = json['videoUrl'],
        title = json['title'],
        isDrama = json['isDrama'],
        isFantastic = json['isFantastic'],
        isComedic = json['isComedic'],
        isAction = json['isAction'],
        isHorror = json['isHorror'],
        isThriller = json['isThriller'];
}
