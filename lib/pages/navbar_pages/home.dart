import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/player/player.dart';
import 'package:movie_streaming_app/scroll_test.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "jodfiejdf";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController controller = PageController();
  int currentIndex = 0;
  int categoryIndex = 0;
  bool isWorked = false;
  List<String> images = [
    "assets/images/img_1.png",
    "assets/images/img_2.png",
    "assets/images/img_3.png"
  ];
  List<String> movieNames = [
    "The First Movie Name",
    "The Second Movie Name",
    "The Thirst Movie Name"
  ];

  List<String> imagesAnimated = [
    "assets/images/img_1.png",
    "assets/images/img_2.png",
    "assets/images/img_3.png",
    "assets/images/img_1.png",
    "assets/images/img_4.png",
    "assets/images/img_2.png",
    "assets/images/img_1.png",
    "assets/images/img_3.png"
  ];

  List<String> names = [
    "The First Movie Name",
    "The Second Movie Name",
    "The Thirst Movie Name",
    "The First Movie Name",
    "The Second Movie Name",
    "The Thirst Movie Name",
    "The First Movie Name",
    "The Second Movie Name",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    images[currentIndex],
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          const Color(0xff38404b).withOpacity(0.4),
                          const Color(0xff38404b).withOpacity(0.6),
                          const Color(0xff38404b).withOpacity(0.8),
                          const Color(0xff38404b),
                          const Color(0xff38404b),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(),
                    height: MediaQuery.of(context).size.height * 0.5,
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
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 16,
                                top: 16,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      movieNames[currentIndex],
                                      style: const TextStyle(
                                        //textStyle: Theme.of(context).textTheme.headline4,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      textAlign: TextAlign.left,
                                      maxLines: 10,
                                    ),
                                  ),
                                  SizedBox(
                                    // color: Colors.blue,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: GestureDetector(
                                      onTap: () {

                                        setState(() {
                                          isWorked = !isWorked;
                                        });
                                      },
                                      child: const Icon(
                                        IconlyBold.play,
                                        color: Colors.red,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      indicator(),
                    ],
                  ),
                ],
              ),
            ),
            ScrollTest(
              images: imagesAnimated,
              name: "Fantastic",
              movies: names,
            ),
            ScrollTest(
              images: imagesAnimated,
              name: "Drama",
              movies: names,
            ),
            ScrollTest(
              images: imagesAnimated,
              name: "Cartoons",
              movies: names,
            ),
            Container(
              height: 200,
              decoration: const BoxDecoration(
                color: Color(0xff38404b),
                //color: Colors.red
              ),
            )
          ],
        ),
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
                borderRadius: BorderRadius.circular(5),
              ),
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
                borderRadius: BorderRadius.circular(5),
              ),
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
                borderRadius: BorderRadius.circular(5),
              ),
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
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffffffff).withOpacity(0.3),
                    const Color(0xffffffff).withOpacity(0.3),
                  ],
                ),
              ),
              child: Text(
                "Movies",
                style: TextStyle(
                  color: categoryIndex == 0
                      ? const Color(0xff38404b)
                      : const Color(0xff38404b).withOpacity(0.6),
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
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffffffff).withOpacity(0.3),
                    const Color(0xffffffff).withOpacity(0.3),
                  ],
                ),
              ),
              child: Text(
                "Series",
                style: TextStyle(
                  color: categoryIndex == 1
                      ? const Color(0xff38404b)
                      : const Color(0xff38404b).withOpacity(0.6),
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
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xffffffff).withOpacity(0.3),
                    const Color(0xffffffff).withOpacity(0.3),
                  ],
                ),
              ),
              child: Text(
                "Trailers",
                style: TextStyle(
                  color: categoryIndex == 2
                      ? const Color(0xff38404b)
                      : const Color(0xff38404b).withOpacity(0.6),
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
