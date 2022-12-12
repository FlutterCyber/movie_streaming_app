import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

class Player extends StatefulWidget {
  static const String id = "player";

  Player({required this.vd_url});

  final String vd_url;

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late final PodPlayerController controller;

  void initState() {
    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(widget.vd_url),
    )..initialise();

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
