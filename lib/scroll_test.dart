import 'package:flutter/material.dart';

class ScrollTest extends StatefulWidget {
  const ScrollTest({super.key, required this.images, required this.name});

  final List<String> images;
  final String name;

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
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff38404b),
        //color: Colors.red
      ),
      //color: Colors.red,
      height: MediaQuery.of(context).size.height * 0.4,
      width: MediaQuery.of(context).size.width,
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
                itemExtent: 120,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.001,
                diameterRatio: 1.2,
                onSelectedItemChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                squeeze: 1.1,
                offAxisFraction: 0.5,
                useMagnifier: true,
                magnification: 1.2,
                childDelegate: ListWheelChildBuilderDelegate(
                    builder: (BuildContext context, int index) {
                  return container(widget.images[index]);
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
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            img,
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 0.2,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
