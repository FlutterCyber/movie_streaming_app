import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/cartoon_model.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/models/serie_model.dart';
import 'package:movie_streaming_app/screens/cartoon_screen.dart';
import 'package:movie_streaming_app/screens/movie_screen.dart';
import 'package:movie_streaming_app/screens/serie_screen.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(
          Icons.clear,
          color: Colors.red,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.red,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<SerieModel> allSeries = context.watch<MoviesProvider>().series;
    List<CartoonModel> allCartoons = context.watch<MoviesProvider>().cartoons;
    List<MovieModel> allMovies = context.watch<MoviesProvider>().movies;
    List<Map<String, dynamic>> searchItems = [];
    List<Map<String, dynamic>> matchQuery = [];

    for (var item in allSeries) {
      searchItems.add({"type": 1, "name": item.name});
    }
    for (var item in allMovies) {
      searchItems.add({"type": 2, "name": item.name});
    }
    for (var item in allCartoons) {
      searchItems.add({"type": 3, "name": item.name});
    }

    for (var item in searchItems) {
      if (item['name'].toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return Container(
      color: const Color(0xff38404b),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var name = matchQuery[index]['name'];
          var type = matchQuery[index]['type'];
          return ListTile(
            title: Text(
              name,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              if (type == 1) {
                for (var item in allSeries) {
                  if (name == item.name) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SerieScreen(
                          serie: item,
                        ),
                      ),
                    );
                  }
                }
              } else if (type == 2) {
                for (var item in allMovies) {
                  if (name == item.name) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieScreen(
                          movie: item,
                        ),
                      ),
                    );
                  }
                }
              } else if (type == 3) {
                for (var item in allCartoons) {
                  if (name == item.name) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartoonScreen(
                          cartoon: item,
                        ),
                      ),
                    );
                  }
                }
              }
            },
          );
        },
        itemCount: matchQuery.length,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SerieModel> allSeries = context.watch<MoviesProvider>().series;
    List<CartoonModel> allCartoons = context.watch<MoviesProvider>().cartoons;
    List<MovieModel> allMovies = context.watch<MoviesProvider>().movies;
    List<Map<String, dynamic>> searchItems = [];
    List<Map<String, dynamic>> matchQuery = [];

    for (var item in allSeries) {
      searchItems.add({"type": 1, "name": item.name});
    }
    for (var item in allMovies) {
      searchItems.add({"type": 2, "name": item.name});
    }
    for (var item in allCartoons) {
      searchItems.add({"type": 3, "name": item.name});
    }

    for (var item in searchItems) {
      if (item['name'].toString().toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return Container(
      color: const Color(0xff38404b),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var name = matchQuery[index]['name'];
          var type = matchQuery[index]['type'];
          return ListTile(
            title: Text(
              name,
              style: const TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              if (type == 1) {
                for (var item in allSeries) {
                  if (name == item.name) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SerieScreen(
                          serie: item,
                        ),
                      ),
                    );
                  }
                }
              } else if (type == 2) {
                for (var item in allMovies) {
                  if (name == item.name) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MovieScreen(
                          movie: item,
                        ),
                      ),
                    );
                  }
                }
              } else if (type == 3) {
                for (var item in allCartoons) {
                  if (name == item.name) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartoonScreen(
                          cartoon: item,
                        ),
                      ),
                    );
                  }
                }
              }
            },
          );
        },
        itemCount: matchQuery.length,
      ),
    );
  }
}
