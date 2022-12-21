class SerieModel {
  String name;
  int year;
  int season;
  double rating;
  String title;
  String imgUrl;
  List<String> videoUrls;
  bool isAction;
  bool isComedic;
  bool isDrama;
  bool isFantastic;
  bool isHorror;
  bool isThriller;

  SerieModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        year = json['year'],
        season = json['season'],
        rating = json['rating'],
        title = json['title'],
        imgUrl = json['imgUrl'],
        videoUrls = List.from(json['videoUrls']),
        isAction = json['isAction'],
        isComedic = json['isComedic'],
        isDrama = json['isDrama'],
        isFantastic = json['isFantastic'],
        isHorror = json['isHorror'],
        isThriller = json['isThriller'];
}
