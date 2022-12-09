import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/providers/download_provider.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class DownloadingWidget extends StatefulWidget {
  const DownloadingWidget(
      {required this.name,
      required this.id,
      required this.url,
      required this.imgUrl,
      required this.index,
      Key? key})
      : super(key: key);
  final String url;
  final String imgUrl;
  final String id;
  final String name;
  final int index;

  @override
  State<DownloadingWidget> createState() => _DownloadingWidgetState();
}

class _DownloadingWidgetState extends State<DownloadingWidget> {
  final Dio dio = Dio();
  CancelToken cancel = CancelToken();
  bool loading = false;
  double progress = 0;
  String savedPath = "";
  int totalSize = 0;
  int downloadedSize = 0;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          log("$directory");
          List<String> paths = directory.path.split("/");
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          newPath = "$newPath/.WatchMe";
          directory = Directory(newPath);
        } else {
          return false;
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return false;
        }
      }
      File saveFile = File("${directory.path}/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path, cancelToken: cancel,
            onReceiveProgress: (value1, value2) {
          setState(() {
            totalSize = value2;
            downloadedSize = value1;
            progress = value1 / value2;
          });
        }).then((value) {
          setState(() {
            savedPath = saveFile.path;
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(
            saveFile.path,
            isReturnPathOfIOS: true,
          );
        }
        return true;
      }
      return false;
    } catch (e) {
      log("$e");
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  downloadFile(String url, String id) async {
    String? format;
    List<String> formats = url.split(".mp4");
    if (formats.length == 1) {
      format = ".mkv";
    } else {
      format = ".mp4";
    }
    loading = true;
    progress = 0;
    bool downloaded = await saveVideo(url, id + format);
    if (downloaded) {
      log("File Downloaded");
    } else {
      log("Problem Downloading File");
    }
    loading = false;
  }

  void cancelDownloading() {
    cancel.cancel();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.red,
        content: Text(
          'Downloading canceled',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 15,
          ),
        ),
      ),
    );
    context.watch<Downloader>().removeFromDownloading(
        context.watch<Downloader>().downloadingMovies[widget.index]);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        MovieModel movie = MovieModel(
          id: widget.id,
          name: widget.name,
          year: 0,
          rating: 0.0,
          title: "",
          imgUrl: widget.imgUrl,
          videoUrl: widget.url,
          path: "",
        );
        downloadFile(widget.url, widget.id);
        context.watch<Downloader>().addToDownloading(movie);
      },
      child: Container(
        height: h * 0.2,
        width: w,
        decoration: BoxDecoration(
            color: const Color(0xff38404b),
            borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 12,
        ),
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          top: 8,
          bottom: 8,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: h * 0.18,
              width: w * 0.35,
              decoration: BoxDecoration(
                color: const Color(0xff38404b).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: widget.imgUrl,
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${double.parse(progress.toStringAsFixed(2)) * 100} % Downloaded"
                            .toUpperCase(),
                        style: TextStyle(
                          color: Colors.grey.shade400,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: h * 0.04,
                        width: h * 0.04,
                        //  color: Colors.green,
                        child: Stack(
                          children: [
                            SizedBox(
                              height: h * 0.04,
                              width: h * 0.04,
                              child: CircularProgressIndicator(
                                value: progress,
                                backgroundColor: Colors.grey,
                                color: Colors.red,
                              ),
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  cancelDownloading();
                                },
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
