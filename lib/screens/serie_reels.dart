import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/providers/movies_provider.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:movie_streaming_app/screens/serie_screen.dart';
import 'package:provider/provider.dart';

class SerieReels extends StatefulWidget {
  const SerieReels({super.key});

  @override
  State<SerieReels> createState() => _SerieReelsState();
}

class _SerieReelsState extends State<SerieReels> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: const Color(0xff38404b),
      height: MediaQuery.of(context).size.height * 0.48,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Series",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Container(),
                      ),
                    );
                  },
                  child: Text(
                    "See All".tr(),
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: context.watch<MoviesProvider>().series.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SerieScreen(
                            serie:
                                context.watch<MoviesProvider>().series[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                        left: index == 0 ? 10 : 12.0,
                        right: index == 4 ? 12 : 0.0,
                      ),
                      height: height * 0.43,
                      width: width * 0.43,
                      decoration: BoxDecoration(
                        color: const Color(0xff38404b).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              height: height * 0.43,
                              width: width * 0.43,
                              fit: BoxFit.cover,
                              imageUrl: context
                                  .watch<MoviesProvider>()
                                  .series[index]
                                  .imgUrl,
                              placeholder: (context, url) => Loading.loading(),
                              errorWidget: (context, url, error) => const Icon(
                                Icons.movie,
                                size: 50,
                                color: Colors.red,
                              ),
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              height: height * 0.43,
                              width: width * 0.43,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaY: 10,
                                                sigmaX: 10,
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 4,
                                                  right: 4,
                                                  bottom: 2,
                                                  top: 2,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Text(
                                                      "${context.watch<MoviesProvider>().series[index].rating} ",
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Favourite(
                                        //   movie: Document(),
                                        //   id: widget.movies[index].id,
                                        // ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.08,
                                    width: width * 0.43,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaY: 10,
                                          sigmaX: 10,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                            top: 4,
                                            bottom: 4,
                                          ),
                                          child: Text(
                                            context
                                                .watch<MoviesProvider>()
                                                .series[index]
                                                .name,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
