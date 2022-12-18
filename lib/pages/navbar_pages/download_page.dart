import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/providers/download_manager.dart';
import 'package:movie_streaming_app/screens/downloaded_item_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../screens/download_item_screen.dart';

class DownloadPage extends StatefulWidget {
  static const String id = "s34c5t9342";

  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  List<MovieModel> movies = [];

  Future<void> getSavedMovies() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      List<String>? tempList = preferences.getStringList('movies');

      for (var item in tempList!) {
        var tempMov = MovieModel.fromJson(jsonDecode(item));
        setState(() {
          movies.add(tempMov);
        });
      }
    } catch (e) {
      log("$e");
    }
    log("Movies: ${movies.length}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSavedMovies();
  }

  @override
  Widget build(BuildContext context) {
    log('Came to download page: downloading movie length: ${DownloadManager.instance.movies.length}');
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
      appBar: AppBar(
        title: Text("Downloads".tr()),
        centerTitle: true,
        backgroundColor: const Color(0xff38404b),
      ),
      body: StreamBuilder<int>(
        stream: DownloadManager.instance.onUpdate.stream,
        builder: (context, snapshot) {
          log('Progress updated: movie length: ${DownloadManager.instance.movies.length}');
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return DownloadItemScreen(
                      movie: DownloadManager.instance.movies[index],
                    );
                  },
                  childCount: DownloadManager.instance.movies.length,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return DownloadedItem(
                      movie: movies[index],
                    );
                  },
                  childCount: movies.length,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
