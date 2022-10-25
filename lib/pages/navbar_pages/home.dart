import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "jodfiejdf";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  int categoryIndex = 2;
  bool isWorked = false;
  List<String> images = [
    "assets/images/img_1.png",
    "assets/images/img_4.png",
    "assets/images/img_3.png"
  ];
  List<String> movieNames = [
    "The First Movie Name",
    "The Second Movie Name",
    "The Thirst Movie Name"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: categoryRow(),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            images[currentIndex],
            fit: BoxFit.cover,
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.transparent,
                  Color(0xff53537a),
                  Color(0xff53537a),
                  Color(0xff53537a),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: PageView(
                    controller: controller,
                    children: [
                      Container(),
                      Container(),
                      Container(),
                    ],
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        movieNames[currentIndex],
                        style: GoogleFonts.mochiyPopOne(
                          //textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                        maxLines: 10,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isWorked = !isWorked;
                        });
                      },
                      child: Icon(
                        IconlyBold.play,
                        color: Colors.red,
                        size: 50,
                      ),
                    )
                  ],
                ),
              ),
              indicator(),
            ],
          )
        ],
      ),
    );
  }

  Widget indicator() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            child: Container(
              height: 5,
              width: currentIndex == 0 ? 25 : 15,
              decoration: BoxDecoration(
                  color: currentIndex == 0 ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(5)),
            ),
            onTap: () {
              setState(() {
                currentIndex = 0;
              });
            },
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            child: Container(
              height: 5,
              width: currentIndex == 1 ? 25 : 15,
              decoration: BoxDecoration(
                  color: currentIndex == 1 ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(5)),
            ),
            onTap: () {
              setState(() {
                currentIndex = 1;
              });
            },
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            child: Container(
              height: 5,
              width: currentIndex == 2 ? 25 : 15,
              decoration: BoxDecoration(
                  color: currentIndex == 2 ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(5)),
            ),
            onTap: () {
              setState(() {
                currentIndex = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget categoryRow() {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.04,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: const Icon(
              IconlyLight.search,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                categoryIndex = 0;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 4,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: categoryIndex == 0 ? Colors.black45 : Colors.black38,
              ),
              child: Text(
                "Movies",
                style: TextStyle(
                  color: categoryIndex == 0 ? Colors.white : Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: categoryIndex == 0 ? 15 : 14,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                categoryIndex = 1;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 4,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: categoryIndex == 1 ? Colors.black45 : Colors.black38,
              ),
              child: Text(
                "Series",
                style: TextStyle(
                  color: categoryIndex == 1 ? Colors.white : Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: categoryIndex == 1 ? 15 : 14,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                categoryIndex = 2;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 4,
                bottom: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: categoryIndex == 2 ? Colors.black45 : Colors.black38,
              ),
              child: Text(
                "Trailers",
                style: TextStyle(
                  color: categoryIndex == 2 ? Colors.white : Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: categoryIndex == 2 ? 15 : 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
