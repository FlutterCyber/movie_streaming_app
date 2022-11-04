import 'dart:ui';
import 'package:flutter/material.dart';

class ScrollTest extends StatefulWidget {
  const ScrollTest({
    super.key,
    required this.images,
    required this.name,
    required this.movies,
  });

  final List<String> images;
  final String name;
  final List<String> movies;

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
      color: const Color(0xff38404b),
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
                    widget.movies[index],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  container(String img, String food) {
    return RotatedBox(
      quarterTurns: 3,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        margin: const EdgeInsets.only(
          left: 4,
          right: 4,
          bottom: 14,
          top: 14,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              color: Colors.white.withOpacity(0.0),
              // height: MediaQuery.of(context).size.height * 0.06,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5,
                    sigmaY: 5,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Flexible(
                        child: Text(
                          food,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
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
            Icons.star,
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
