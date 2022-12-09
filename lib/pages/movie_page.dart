import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/player/player.dart';
import 'package:movie_streaming_app/providers/download_provider.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatefulWidget {
  static const String id = "page";

  const MoviePage({required this.movie, super.key});

  final Document movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  PageController controller = PageController();
  String name = "The name of the movie the of the";
  String time = "2 h 32 m";
  bool isreadmore = false;

  //String rate = "8.5";

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    String genre = '';

    if (widget.movie.map['movie']['isThriller']) {
      genre = " Thriller";
    }
    if (widget.movie.map['movie']['isHorror']) {
      genre = " Horror";
    }
    if (widget.movie.map['movie']['isAction']) {
      genre = " Action";
    }
    if (widget.movie.map['movie']['isComedic']) {
      genre = " Comedy";
    }
    if (widget.movie.map['movie']['isFantastic']) {
      genre = " Fantastic";
    }
    if (widget.movie.map['movie']['isDrama']) {
      genre = " Drama";
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xff38404b),
              child: Column(
                children: [
                  SizedBox(
                    height: isreadmore ? _height : _height * 0.85,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          widget.movie.map['movie']['imgUrl'],
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.transparent,
                                const Color(0xff38404b).withOpacity(0.4),
                                const Color(0xff38404b).withOpacity(0.6),
                                const Color(0xff38404b).withOpacity(0.8),
                                const Color(0xff38404b),
                                const Color(0xff38404b),
                                const Color(0xff38404b),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ////icon
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Player(
                                                    vd_url: widget
                                                            .movie.map['movie']
                                                        ['videoUrl'],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          IconlyBold.play,
                                          color: Colors.red,
                                          size: 50,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                ),
                                /////name movie
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          name,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        IconlyBold.star,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                      Text(
                                          " ${widget.movie.map['movie']['rating']}")
                                    ],
                                  ),
                                ),

                                /////data of the movie
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          IconlyBold.calendar,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          widget.movie.map['movie']['year']
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "|",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          IconlyBold.time_circle,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          time,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Text(
                                          "|",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          IconlyBold.video,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          genre,
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                /////// story line
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 30, right: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Story Line",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white),
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                context
                                                    .read<Downloader>()
                                                    .addToDownloading(
                                                      MovieModel(
                                                        id: widget.movie.id,
                                                        name: widget.movie
                                                                .map['movie']
                                                            ['name'],
                                                        year: widget.movie
                                                                .map['movie']
                                                            ['year'],
                                                        rating: widget.movie
                                                                .map['movie']
                                                            ['rating'],
                                                        title: widget.movie
                                                                .map['movie']
                                                            ['title'],
                                                        imgUrl: widget.movie
                                                                .map['movie']
                                                            ['imgUrl'],
                                                        path: "",
                                                        videoUrl: widget.movie
                                                                .map['movie']
                                                            ['videoUrl'],
                                                      ),
                                                    );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    backgroundColor:
                                                        Colors.green,
                                                    content: Row(
                                                      children: const [
                                                        Text(
                                                          "Movie added to downloads",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .cloud_done_outlined,
                                                          color: Colors.white,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                IconlyLight.download,
                                                color: Colors.red,
                                                size: 28,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.share,
                                                color: Colors.red,
                                                size: 28,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                /////description
                                Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 30, right: 15),
                                      child: Text(
                                        widget.movie.map['movie']['title'],
                                        maxLines: isreadmore ? 8 : 2,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          isreadmore = !isreadmore;
                                        });
                                      },
                                      child: Text(
                                        isreadmore ? "Read Less" : "Read More",
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "The Cast",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: const EdgeInsets.only(top: 20),
                          color: const Color(0xff38404b),
                          child: Row(
                            children: [
                              buildContainer("assets/images/img_1.png"),
                              buildContainer("assets/images/img_1.png"),
                              buildContainer("assets/images/img_1.png"),
                              buildContainer("assets/images/img_1.png"),
                              buildContainer("assets/images/img_1.png"),
                              buildContainer("assets/images/img_1.png"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(String img_link) {
    return Container(
      margin: const EdgeInsets.only(right: 10, left: 10, bottom: 20),
      width: 75,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(img_link),
          )),
    );
  }
}
