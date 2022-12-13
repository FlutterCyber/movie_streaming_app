import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class DownloadItemScreen extends StatefulWidget {
  const DownloadItemScreen({
    required this.movie,
    Key? key,
  }) : super(key: key);
  final MovieModel movie;

  @override
  State<DownloadItemScreen> createState() => _DownloadItemScreenState();
}

class _DownloadItemScreenState extends State<DownloadItemScreen> {
  static final Dio dio = Dio();
  double progress = 0.0;

  Future<bool> saveVideo(String url, String fileName) async {
    Directory? directory;
    try {
      if (Platform.isAndroid) {
        if (await _requestPermission(Permission.storage)) {
          directory = (await getExternalStorageDirectory())!;
          String newPath = "";
          log(directory.path);
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
          log("Not permission to storage!");
        }
      } else {
        if (await _requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          log("Not permission to storage!");
        }
      }
      File saveFile = File("${directory!.path}/$fileName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
        }
      }
      return true;
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveVideo(widget.movie.videoUrl, widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 8,
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 8,
      ),
      height: h * 0.18,
      width: w,
      decoration: BoxDecoration(
        color: const Color(0xff38404b),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: h * 0.16,
            height: h * 0.16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: "http://cdn.motorpage.ru/Photos/800/3CB0.jpg",
                placeholder: (context, url) => Loading.loading(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.movie,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  widget.movie.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$progress %",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: w - h * 0.3,
                      child: LinearProgressIndicator(
                        backgroundColor: Colors.grey,
                        color: Colors.red,
                        value: progress,
                        semanticsLabel: 'Downloading progress',
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
