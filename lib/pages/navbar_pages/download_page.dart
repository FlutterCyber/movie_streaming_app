import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_streaming_app/providers/download_manager.dart';

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
    log('Came to download page: downloading movie length: ${DownloadManager.instance.movies.length}');
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
      appBar: AppBar(
        title: const Text("Downloads"),
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
                ), //
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 200,
                  ),
                ),
              ],
            );
          }),
    );
  }
}