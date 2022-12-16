import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class PlayerLocal extends StatefulWidget {
  const PlayerLocal({required this.path, Key? key}) : super(key: key);
  final String path;

  @override
  State<PlayerLocal> createState() => _PlayerLocalState();
}

class _PlayerLocalState extends State<PlayerLocal> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.file(File(widget.path)))
      ..initialise();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: PodVideoPlayer(
          backgroundColor: Colors.grey,
          controller: controller,
        ),
      ),
    );
  }
}
