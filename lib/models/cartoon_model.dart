class CartoonModel {
  String name;
  double rating;
  bool isAction;
  bool isComedic;
  String title;
  int year;
  String imgUrl;
  String videoUrl;

  CartoonModel.fromJson(Map<String, dynamic> map)
      : name = map['name'],
        rating = map['rating'],
        isAction = map['isAction'],
        isComedic = map['isComedic'],
        title = map['title'],
        year = map['year'],
        imgUrl = map['imgUrl'],
        videoUrl = map['videoUrl'];
}
