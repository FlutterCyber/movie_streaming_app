import 'dart:async';

import 'package:flutter/material.dart';

class TimerImage extends StatefulWidget {
  const TimerImage({Key? key}) : super(key: key);

  @override
  State<TimerImage> createState() => _TimerImageState();
}

class _TimerImageState extends State<TimerImage> {
  int index = 0;
  List<String> images = [
    "assets/images/img_1.png",
    "assets/images/img_2.png",
    "assets/images/img_3.png",
    "assets/images/img_1.png",
    "assets/images/img_4.png",
    "assets/images/img_2.png",
    "assets/images/img_1.png",
    "assets/images/img_3.png"
  ];

  void changeBackground() {
    Timer.periodic(const Duration(seconds: 2), (timer) {
      if (index < images.length-1) {
        setState(() {
          index++;
        });
      } else {
        setState(() {
          index = 0;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    changeBackground();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              images[index],
            ),
          ),
        ),
      ),
    );
  }
}
