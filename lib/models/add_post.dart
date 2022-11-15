class Post {
  String userId;
  String rate;
  String nameOfMovie;
  String imagelink;
  String videolink;
  String janr;
  String date;

  Post(
      {required this.userId,
      required this.rate,
      required this.nameOfMovie,
      required this.imagelink,
      required this.videolink,
      required this.janr,
      required this.date});

  Post.fromJson(Map<String, dynamic> map)
      : userId = map["userId"],
        rate = map["rate"],
        nameOfMovie = map["nameOfMovie"],
        imagelink = map["imagelink"],
        videolink = map["videolink"],
        janr = map["janr"],
        date = map["date"];

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "rate": rate,
        "nameOfMovie": nameOfMovie,
        "imagelink": imagelink,
        "videolink": videolink,
        "janr": janr,
        "date": date
      };
}
