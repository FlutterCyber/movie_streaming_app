import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/pages/account_page.dart';
import 'package:movie_streaming_app/pages/account_page2.dart';
import 'package:movie_streaming_app/pages/download_page.dart';
import 'package:movie_streaming_app/pages/navbar_pages/home.dart';
import 'package:movie_streaming_app/pages/navbar_pages/playlist.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: PageView(
        controller: controller,
        children: const [
          HomeScreen(),
          DownloadPage(),
          PlaylistPage(),
          Account(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: navbar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // bottomNavigationBar: navbar(),
    );
  }

  Widget navbar() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 15,
            sigmaY: 15,
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.075,
            padding: const EdgeInsets.only(),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xffffffff).withOpacity(0.1),
                  const Color(0xffffffff).withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(0);
                      currentIndex = 0;
                    });
                  },
                  child: Icon(
                    currentIndex == 0 ? IconlyBold.home : IconlyLight.home,
                    color: currentIndex == 0 ? Colors.white : Colors.grey,
                    size: currentIndex == 0 ? 30 : 28,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(1);
                      currentIndex = 1;
                    });
                  },
                  child: Icon(
                    currentIndex == 1
                        ? IconlyBold.download
                        : IconlyLight.download,
                    color: currentIndex == 1 ? Colors.white : Colors.grey,
                    size: currentIndex == 1 ? 30 : 28,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(2);
                      currentIndex = 2;
                    });
                  },
                  child: Icon(
                    currentIndex == 2 ? IconlyBold.heart : IconlyLight.heart,
                    color: currentIndex == 2 ? Colors.white : Colors.grey,
                    size: currentIndex == 2 ? 30 : 28,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      controller.jumpToPage(3);
                      currentIndex = 3;
                    });
                  },
                  child: Icon(
                    currentIndex == 3
                        ? IconlyBold.profile
                        : IconlyLight.profile,
                    color: currentIndex == 3 ? Colors.white : Colors.grey,
                    size: currentIndex == 3 ? 30 : 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
