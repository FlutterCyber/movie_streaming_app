import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/pages/account_page.dart';
import 'package:movie_streaming_app/pages/navbar_pages/home.dart';
import 'package:movie_streaming_app/pages/navbar_pages/other_page.dart';
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
          OtherPage(),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: navbar(),
    );
  }

  Widget navbar() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        topRight: Radius.circular(50),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 15,
          sigmaY: 15,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.085,
          padding: const EdgeInsets.only(),
          decoration:  BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16172B).withOpacity(0.5),
                Color(0xff16172B).withOpacity(0.5),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
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
                  size: currentIndex == 0 ? 34 : 28,
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
                  currentIndex == 1 ? IconlyBold.download : IconlyLight.download,
                  color: currentIndex == 1 ? Colors.white : Colors.grey,
                  size: currentIndex == 1 ? 34 : 28,
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
                  currentIndex == 2 ? IconlyBold.chat : IconlyLight.chat,
                  color: currentIndex == 2 ? Colors.white : Colors.grey,
                  size: currentIndex == 2 ? 34 : 28,
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
                  currentIndex == 3 ? IconlyBold.profile : IconlyLight.profile,
                  color: currentIndex == 3 ? Colors.white : Colors.grey,
                  size: currentIndex == 3 ? 34 : 28,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
