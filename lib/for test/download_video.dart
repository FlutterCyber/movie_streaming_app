import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

const url =
    "https://firebasestorage.googleapis.com/v0/b/shahbozpandacham.appspot.com/o/videoplayback.mp4?alt=media&token=00710338-cb92-4ddb-9208-9bcf35a7b181";

class DownVideoPage extends StatefulWidget {
  const DownVideoPage({Key? key}) : super(key: key);

  @override
  State<DownVideoPage> createState() => _DownVideoPageState();
}

class _DownVideoPageState extends State<DownVideoPage> {
  ReceivePort port = ReceivePort();
  String pro = "0.0";

  Future<void> downloading() async {
    var status = await Permission.storage.request();

    if (status.isGranted) {
      final baseStorage = await getExternalStorageDirectory();
      await FlutterDownloader.enqueue(
        url: url,
        savedDir: baseStorage!.path,
        showNotification: true,
        openFileFromNotification: true,
      );
    }
  }

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      setState(() {
        pro = "${data[2]}";
      });
    });

    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
      appBar: AppBar(
        title: const Text("Downloading Test"),
        backgroundColor: const Color(0xff38404b),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              pro,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: downloading,
              child: const Text("Download"),
            ),
          ],
        ),
      ),
    );
  }
}
