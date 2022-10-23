import 'package:flutter/material.dart';
import 'package:movie_streaming_app/screens/search_bar_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "Wcsucscb";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          "assets/images/n_icon.png",
          height: MediaQuery.of(context).size.height * 0.05,
          width: MediaQuery.of(context).size.height * 0.05,
          fit: BoxFit.cover,
        ),
        actions: [
          GestureDetector(
            child: const Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: 40,
            ),
            onTap: () {
              showSearch(
                context: context,
                delegate: MySearchBar(),
              );
            },
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
