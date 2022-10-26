import 'dart:async';

import 'package:flutter/material.dart';
class Slideshowtest extends StatefulWidget {
  static const String id = "eoifec90ermcge0rgceme";
  const Slideshowtest({Key? key}) : super(key: key);

  @override
  State<Slideshowtest> createState() => _SlideshowtestState();
}

class _SlideshowtestState extends State<Slideshowtest> {
  int s = 1;
  List<String> imglist = [
    "img_1.png",
    "img_2.png",
    "img_3.png",
    "LoginImage.jpg",
    "start2.jpg"
  ];
  String? img1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    img1 = "assets/images/" + imglist[s].toString();
    setState(() {
      counterImage();
    });
  }

  void counterImage() {
    for (int i = 0; i < 999; i++) {

      Timer(Duration(seconds: 2), () {
        setState(() {
          img1 = "assets/images/" + imglist[s].toString();
          if (s == imglist.length) {
            s = 0;
          }
        });
        s++;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height:750,
          width: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(img1!),
            )
          ),
        ),
      ),
    );
  }
}
