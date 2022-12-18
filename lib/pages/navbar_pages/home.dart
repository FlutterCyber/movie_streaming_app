import 'package:easy_localization/easy_localization.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:movie_streaming_app/screens/splash_appbar.dart';
import 'package:movie_streaming_app/screens/movie_reels.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "jodfiejdf";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///
  ///
  PageController controller = PageController();
  int currentIndex = 0;
  int categoryIndex = 0;
  bool isWorked = false;
  List<String> images = [];
  List<String> movieNames = [];
  List<Document> movies = [];

  List<Document> action = [];
  List<Document> drama = [];
  List<Document> comedy = [];

  CollectionReference allMovies = Firestore.instance.collection('movies');

  Future getMovies() async {
    final result = await allMovies.orderBy("movie").get();
    setState(() {
      movies.addAll(result);
    });
    setState(() {
      images.add(movies[5].map['movie']["imgUrl"]);
      images.add(movies[1].map['movie']["imgUrl"]);
      images.add(movies[2].map['movie']["imgUrl"]);
      movieNames.add(movies[5].map['movie']["name"]);
      movieNames.add(movies[1].map['movie']["name"]);
      movieNames.add(movies[2].map['movie']["name"]);
    });
    for (int i = 0; i < movies.length; i++) {
      if (movies[i].map['movie']['isAction']) {
        setState(() {
          action.add(movies[i]);
        });
      } else if (movies[i].map['movie']['isDrama']) {
        setState(() {
          drama.add(movies[i]);
        });
      } else if (movies[i].map['movie']['isComedic']) {
        setState(() {
          comedy.add(movies[i]);
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: categoryRow(),
      ),
      body: movies.isEmpty
          ? Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color(0xff38404b),
              child: Center(
                child: Container(
                  height: width * 0.3,
                  width: width * 0.3,
                  margin: const EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(width),
                  ),
                  child: Loading.loading(),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SplashAppBar(movies: movies),
                  ScrollTest(movies: action, category: "Action".tr()),
                  ScrollTest(movies: drama, category: "Drama".tr()),
                  ScrollTest(movies: comedy, category: "Comedy".tr()),
                  Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      color: Color(0xff38404b),
                      //color: Colors.red
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget indicator() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              height: 5,
              width: currentIndex == 0 ? 25 : 15,
              decoration: BoxDecoration(
                color: currentIndex == 0 ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            child: Container(
              height: 5,
              width: currentIndex == 1 ? 25 : 15,
              decoration: BoxDecoration(
                color: currentIndex == 1 ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            child: Container(
              height: 5,
              width: currentIndex == 2 ? 25 : 15,
              decoration: BoxDecoration(
                color: currentIndex == 2 ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            onTap: () {
              setState(() {
                currentIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget categoryRow() {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: const Icon(
              IconlyLight.search,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                categoryIndex = 0;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 4,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffffffff).withOpacity(0.3),
                    const Color(0xffffffff).withOpacity(0.3),
                  ],
                ),
              ),
              child: Text(
                "Movies".tr(),
                style: TextStyle(
                  color: categoryIndex == 0
                      ? const Color(0xff38404b)
                      : const Color(0xff38404b).withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: categoryIndex == 0 ? 15 : 14,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                categoryIndex = 1;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 4,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffffffff).withOpacity(0.3),
                    const Color(0xffffffff).withOpacity(0.3),
                  ],
                ),
              ),
              child: Text(
                "Series".tr(),
                style: TextStyle(
                  color: categoryIndex == 1
                      ? const Color(0xff38404b)
                      : const Color(0xff38404b).withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: categoryIndex == 1 ? 15 : 14,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                categoryIndex = 2;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 4,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffffffff).withOpacity(0.3),
                    const Color(0xffffffff).withOpacity(0.3),
                  ],
                ),
              ),
              child: Text(
                "Trailers".tr(),
                style: TextStyle(
                  color: categoryIndex == 2
                      ? const Color(0xff38404b)
                      : const Color(0xff38404b).withOpacity(0.6),
                  fontWeight: FontWeight.bold,
                  fontSize: categoryIndex == 2 ? 15 : 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
