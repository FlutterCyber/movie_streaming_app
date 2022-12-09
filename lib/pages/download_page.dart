import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/download_model.dart';
import 'package:movie_streaming_app/screens/downloading.dart';
import 'package:provider/provider.dart';

import '../providers/download_provider.dart';

class DownloadPage extends StatefulWidget {
  static const String id = "s34c5t9342";

  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.5),
      appBar: AppBar(
        title: const Text("Downloads"),
        centerTitle: true,
        backgroundColor: const Color(0xff38404b),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                var movie =
                    context.watch<Downloader>().downloadingMovies[index];
                return DownloadingWidget(
                  name: movie.name,
                  id: movie.id,
                  url: movie.videoUrl,
                  imgUrl: movie.imgUrl,
                  index: index,
                );
              },
              childCount: context.watch<Downloader>().downloadingMovies.length,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
