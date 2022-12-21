import 'dart:developer';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_streaming_app/pages/movie_page.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlaylistPage extends StatefulWidget {
  static const String id = "dmvdmvidvm1232323";

  const PlaylistPage({Key? key}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  List<Document> movies = [];
  CollectionReference allMovies = Firestore.instance.collection('movies');

  Future getMovies() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final result = await allMovies.orderBy("movie").get();
    log(result.toString());
    for (int i = 0; i < result.length; i++) {
      String id = result[i].id;
      try {
        bool isLiked = preferences.getBool(id)!;
        if (isLiked) {
          setState(() {
            movies.add(result[i]);
          });
        }
      } catch (e) {
        log("$e");
      }
    }
  }

  Future onDelete(String id, int index) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      movies.removeAt(index);
      preferences.remove(id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
      appBar: AppBar(
        title: Text("Favorites".tr()),
        centerTitle: true,
        backgroundColor: const Color(0xff38404b),
      ),
      body: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MoviePage(
                          movie: movies[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: h * 0.18,
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 10,
                      right: 10,
                    ),
                    margin: EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 16,
                        bottom: index == movies.length - 1 ? 150 : 0),
                    decoration: BoxDecoration(
                      color: const Color(0xff38404b),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: w * 0.25,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: CachedNetworkImage(
                              width: w * 0.25,
                              height: h * 0.18-18,
                              // height: h * 0.43,
                              // width: w * 0.43,
                              fit: BoxFit.cover,
                              imageUrl: movies[index].map['movie']['imgUrl'],
                              placeholder: (context, url) => Loading.loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.movie,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    movies[index].map['movie']['name'],
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          movies[index]
                                              .map['movie']['year']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.red,
                                        ),
                                        Text(
                                          movies[index]
                                              .map['movie']['rating']
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            onDelete(movies[index].id, index)
                                                .then(
                                              (value) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                      'Movie successfully deleted!',
                                                    ),
                                                    backgroundColor: Colors.red,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
