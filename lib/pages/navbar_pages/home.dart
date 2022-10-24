import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/resources/home_screen_resources.dart';
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
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     GestureDetector(
      //       child: const Icon(
      //         Icons.search_sharp,
      //         color: Colors.white,
      //         size: 40,
      //       ),
      //       onTap: () {
      //         showSearch(
      //           context: context,
      //           delegate: MySearchBar(),
      //         );
      //       },
      //     ),
      //     const SizedBox(width: 10),
      //   ],
      // ),
      body: CustomScrollView(
        slivers: [
          appBar(),
          SliverToBoxAdapter(
            child: Container(
              height: 2000,
            ),
          )
        ],
      ),
    );
  }

  String categoryView(List<String> categories) {
    String text = '';
    for (int i = 0; i < categories.length; i++) {
      if (i != categories.length - 1) {
        text += "${categories[i]} • ";
      } else {
        text += categories[i];
      }
    }
    return text;
  }

  Widget appBar(){
    return  SliverAppBar(
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
        //const SizedBox(width: 10),
      ],
      floating: true,
      pinned: true,
      snap: true,
      leading: Image.asset(
        "assets/images/n_icon.png",
        height: MediaQuery.of(context).size.height * 0.05,
        width: MediaQuery.of(context).size.height * 0.05,
        fit: BoxFit.cover,
      ),
      expandedHeight: MediaQuery.of(context).size.height * 0.4,
      flexibleSpace: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/cb39407adad37b0c65fc2ec075636e721-edited.webp",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black38,
                    Colors.black54,
                    Colors.black87,
                  ],
                ),
              ),
              alignment: Alignment.bottomCenter,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: 12,
                      ),
                      child: Center(
                        child: Text(
                          HomeScreenResources.appbarMovie,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        categoryView(HomeScreenResources.category),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              Text(
                                "My List",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow,
                            color: Colors.black,
                          ),
                          label: const Text(
                            "Play",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                              Text(
                                "Info",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
