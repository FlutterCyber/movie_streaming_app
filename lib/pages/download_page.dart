import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:movie_streaming_app/providers/download_provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class DownloadPage extends StatefulWidget {
  static const String id = "s34c5t9342";

  const DownloadPage({Key? key}) : super(key: key);

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  final Dio dio = Dio();
  bool loading = false;
  double progress = 0;
  String savedPath = "";

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
          newPath = "$newPath/WatchMe";
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
        await dio.download(url, saveFile.path,
            onReceiveProgress: (value1, value2) {
          setState(() {
            progress = value1 / value2;
          });
        }).then((value) {
          setState(() {
            savedPath = saveFile.path;
          });
        });
        if (Platform.isIOS) {
          await ImageGallerySaver.saveFile(saveFile.path,
              isReturnPathOfIOS: true);
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

  downloadFile() async {
    setState(() {
      loading = true;
      progress = 0;
    });
    bool downloaded = await saveVideo(
        "https://firebasestorage.googleapis.com/v0/b/watch-me-3c437.appspot.com/o/movie%201%2FAlec%20Benjamin%20-%20Let%20Me%20Down%20Slowly%20%5BOfficial%20Music%20Video%5D.mp4?alt=media&token=72ec9848-7e98-4df8-aa79-4cbd900e5308",
        "video.mp4");
    if (downloaded) {
      log("File Downloaded");
    } else {
      log("Problem Downloading File");
    }
    setState(() {
      loading = false;
    });
  }

  /// final SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   // Encode and store data in SharedPreferences
  //   final String encodedData = Music.encode([
  //     Music(id: 1, ...),
  //     Music(id: 2, ...),
  //     Music(id: 3, ...),
  //   ]);
  //
  //   await prefs.setString('musics_key', encodedData);
  //
  //   // Fetch and decode data
  //   final String musicsString = await prefs.getString('musics_key');
  //
  //   final List<Music> musics = Music.decode(musicsString);
  String prg = "0";

  void setSt() {
    final prog = Provider.of<Downloader>(context, listen: false).prg.toString();
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        prg = prog;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.5),
      appBar: AppBar(
        title: const Text("Downloads"),
        centerTitle: true,
        backgroundColor: const Color(0xff38404b),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              const url =
                  "https://firebasestorage.googleapis.com/v0/b/watch-me-3c437.appspot.com/o/movie%201%2FAlec%20Benjamin%20-%20Let%20Me%20Down%20Slowly%20%5BOfficial%20Music%20Video%5D.mp4?alt=media&token=72ec9848-7e98-4df8-aa79-4cbd900e5308";
              context.read<Downloader>().downloadFile(url, "movie111");
              setSt();
            },
            child: const Text("DOWNLOAD"),
          ),
          Text(
            context.watch<Downloader>().pth,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "--------------------------------------------------",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            prg,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
