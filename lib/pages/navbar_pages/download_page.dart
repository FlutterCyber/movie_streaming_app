import 'package:flutter/material.dart';
import 'package:movie_streaming_app/providers/download_provider.dart';
import 'package:provider/provider.dart';

import '../../screens/download_item_screen.dart';

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
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
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
                return DownloadItemScreen(
                  movie: context.watch<Downloader>().movies[index],
                );
              },
              childCount: context.watch<Downloader>().movies.length,
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
