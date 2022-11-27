import 'package:cached_network_image/cached_network_image.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/pages/movie_page.dart';

import 'loading_widget.dart';

class SplashAppBar extends StatefulWidget {
  const SplashAppBar({required this.movies, Key? key}) : super(key: key);
  final List<Document> movies;

  @override
  State<SplashAppBar> createState() => _SplashAppBarState();
}

class _SplashAppBarState extends State<SplashAppBar> {
  int page = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff38404b),
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              controller: controller,
              onPageChanged: (int index) {
                setState(() {
                  page = index;
                });
              },
              children: [
                itemWidget(widget.movies[1], context),
                itemWidget(widget.movies[2], context),
                itemWidget(widget.movies[4], context),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 12,
                    bottom: 12,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.jumpToPage(0);
                          });
                        },
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          width: page == 0 ? 30 : 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          width: page == 1 ? 30 : 15,
                        ),
                        onTap: () {
                          setState(() {
                            controller.jumpToPage(0);
                          });
                        },
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            controller.jumpToPage(0);
                          });
                        },
                        child: Container(
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          width: page == 2 ? 30 : 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: MediaQuery.of(context).size.width * 0.1,
                    top: 12,
                    bottom: 28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MoviePage(
                                movie: widget.movies[page],
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.play_circle,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWidget(Document movie, BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            imageUrl: movie.map['movie']['imgUrl'],
            placeholder: (context, url) => Loading.loading(),
            errorWidget: (context, url, error) => const Icon(
              Icons.movie,
              size: 50,
              color: Colors.red,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              left: 12,
              right: MediaQuery.of(context).size.width * 0.4,
              bottom: 24,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  Colors.transparent,
                  const Color(0xff38404b).withOpacity(0.3),
                  const Color(0xff38404b).withOpacity(0.4),
                  const Color(0xff38404b).withOpacity(0.7),
                  const Color(0xff38404b).withOpacity(0.8),
                  const Color(0xff38404b).withOpacity(0.9),
                  const Color(0xff38404b).withOpacity(0.92),
                  const Color(0xff38404b).withOpacity(0.935),
                  const Color(0xff38404b).withOpacity(0.95),
                  const Color(0xff38404b).withOpacity(0.98),
                  const Color(0xff38404b),
                  //const Color(0xff38404b),
                  // const Color(0xff38404b),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.map['movie']['name'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
