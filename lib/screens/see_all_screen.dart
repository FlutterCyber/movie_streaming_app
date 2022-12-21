import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firedart/firedart.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:movie_streaming_app/screens/movie_screen.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({
    Key? key,
    required this.movies,
    required this.name,
  }) : super(key: key);
  final String name;
  final List<Document> movies;

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
      appBar: AppBar(
        title: Text(widget.name),
        backgroundColor: const Color(0xff38404b),
      ),
      body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            var mov = MovieModel(
              id: widget.movies[index].id,
              name: widget.movies[index].map['movie']['name'],
              year: widget.movies[index].map['movie']['year'],
              rating: widget.movies[index].map['movie']['rating'],
              title: widget.movies[index].map['movie']['title'],
              imgUrl: widget.movies[index].map['movie']['imgUrl'],
              videoUrl: widget.movies[index].map['movie']['videoUrl'],
              path: '',
            );
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => MovieScreen(movie: mov)));
              },
              child: Container(
                margin: EdgeInsets.only(
                  left: 6,
                  right: 6,
                  top: 12,
                  bottom: index == widget.movies.length - 1 ? 100.0 : 0.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff38404b),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 15,
                      sigmaY: 15,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: 6,
                        bottom: 6,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.height * 0.18,
                              fit: BoxFit.cover,
                              imageUrl: widget.movies[index].map['movie']
                                  ['imgUrl'],
                              placeholder: (context, url) => Loading.loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.movie,
                                size: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                MediaQuery.of(context).size.height * 0.24,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.movies[index].map['movie']['name'],
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 2,
                                        bottom: 8,
                                      ),
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff38404b),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            widget.movies[index]
                                                .map['movie']['rating']
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 2,
                                        bottom: 8,
                                      ),
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff38404b),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            widget.movies[index]
                                                .map['movie']['year']
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.calendar_month_outlined,
                                            color: Colors.amber,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: widget.movies.length),
    );
  }
}
