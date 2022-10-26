import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ScrollTest extends StatefulWidget {
  const ScrollTest({Key? key}) : super(key: key);

  @override
  State<ScrollTest> createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  FixedExtentScrollController controller = FixedExtentScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(pi / 2),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: ListWheelScrollView(
                controller: controller,
                children: [
                  container("assets/images/img_1.png"),
                  container("assets/images/img_2.png"),
                  container("assets/images/img_3.png"),
                  container("assets/images/img_4.png"),
                  container("assets/images/img_2.png"),
                  container("assets/images/img_3.png"),
                ],
                itemExtent: 100,
                physics: const FixedExtentScrollPhysics(),
                // perspective: 0.003,
                // diameterRatio: 1.19,
                // onSelectedItemChanged: (index) {},
                // squeeze: 1.1,
                // offAxisFraction: 1.3,
                useMagnifier: true,
                magnification: 1.2,
              ),
            ),
          )
        ],
      ),
    );
  }

  container(String img) {
    return RotationTransition(
      alignment: Alignment.center,
      turns: AlwaysStoppedAnimation(270 / 360),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          img,
          height: 300,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
// RotationTransition(
//   turns: new AlwaysStoppedAnimation(15 / 360),
//   child: new Text("Lorem ipsum"),
// )
}
