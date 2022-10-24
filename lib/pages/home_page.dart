import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Colors.black,
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
          title: Text(
            "Home",
            style: TextStyle(
              color: currentIndex == 0 ? Colors.white : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          icon: const Icon(Icons.home),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.search,
          ),
          title: Text(
            "Search",
            style: TextStyle(
              color: currentIndex == 1 ? Colors.white : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.video_collection_rounded,
          ),
          title: Text(
            "My Playlist",
            style: TextStyle(
              color: currentIndex == 2 ? Colors.white : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CustomNavigationBarItem(
          icon: const Icon(
            Icons.account_circle_outlined,
          ),
          title: Text(
            "Home",
            style: TextStyle(
              color: currentIndex == 3 ? Colors.white : Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
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
