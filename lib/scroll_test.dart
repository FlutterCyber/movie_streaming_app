import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/screens/favourite.dart';

class ScrollTest extends StatefulWidget {
  const ScrollTest({
    super.key,
    required this.images,
    required this.name,
    required this.movie,
  });

  final List<String> images;
  final String name;
  final List<String> movie;

  @override
  State<ScrollTest> createState() => _ScrollTestState();
}

class _ScrollTestState extends State<ScrollTest> {
  FixedExtentScrollController controller =
      FixedExtentScrollController(initialItem: 3);
  int currentIndex = 3;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff38404b),
        //color: Colors.red
      ),
      //color: Colors.red,
      height: height * 0.4,
      width: width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            child: RotatedBox(
              quarterTurns: 1,
              child: ListWheelScrollView.useDelegate(
                controller: controller,
                itemExtent: 140,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.001,
                diameterRatio: 1.2,
                onSelectedItemChanged: (index) {
                  if (index < widget.images.length && index >= 0) {
                    setState(() {
                      currentIndex = index;
                    });
                  } else {
                    controller.animateToItem(
                      widget.images.length ~/ 2,
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.linear,
                    );
                  }
                },
                squeeze: 1.1,
                offAxisFraction: 0.5,
                useMagnifier: false,
                magnification: 1.2,
                childDelegate: ListWheelChildBuilderDelegate(
                    builder: (BuildContext context, int index) {
                  return container(
                    widget.images[index],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  container(String img) {
    return RotatedBox(
      quarterTurns: 3,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(img),
                fit: BoxFit.cover,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaY: 10,
                  sigmaX: 10,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      img,
                      height: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width * 0.2,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rating(double rating) {
    return Container(
      padding: const EdgeInsets.only(
        left: 5,
        right: 5,
        top: 3,
        bottom: 3,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
        ),
        gradient: LinearGradient(
          colors: [
            const Color(0xffffffff).withOpacity(0.3),
            const Color(0xffffffff).withOpacity(0.3),
          ],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            IconlyBold.star,
            color: Colors.amber,
            size: 18,
          ),
          Text(
            " $rating",
            style: const TextStyle(
              color: Color(0xff38404b),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
