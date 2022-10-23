import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/pages/navbar_pages/account_page.dart';
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
      backgroundColor: Colors.black,
      body: PageView(
        children: const [
          HomeScreen(),
          OtherPage(),
          PlaylistPage(),
          AccPage(),
        ],
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: navbar(),
    );
  }

  Widget navbar() {
    return CustomNavigationBar(
      elevation: 0.0,
      iconSize: 30.0,
      selectedColor: Colors.white,
      strokeColor: Colors.white,
      unSelectedColor: Colors.grey,
      backgroundColor: Colors.black87,
      items: [
        CustomNavigationBarItem(
          title: const Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          icon: Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: const Icon(Icons.search),
          title: const Text(
            "Search",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.video_collection_rounded),
          title: const Text(
            "My Playlist",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          title: Text(
            "Home",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
      currentIndex: currentIndex,
      onTap: (index) {
        controller.jumpToPage(index);
        setState(() {
          currentIndex = index;
        });
      },
    );
  }
}
