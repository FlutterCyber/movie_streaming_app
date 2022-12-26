import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/providers/movies_provider.dart';
import 'package:movie_streaming_app/screens/cartoon_screen.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:provider/provider.dart';

class AllCartoons extends StatelessWidget {
  const AllCartoons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: const Color(0xff38404b),
        title: const Text("All Cartoons"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                var cartoon = context.watch<MoviesProvider>().cartoons[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CartoonScreen(cartoon: cartoon)
                      ),
                    );
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff38404b),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            width: MediaQuery.of(context).size.width * 0.3,
                            fit: BoxFit.cover,
                            imageUrl: context
                                .watch<MoviesProvider>()
                                .cartoons[index]
                                .imgUrl,
                            placeholder: (context, url) => Loading.loading(),
                            errorWidget: (context, url, error) => const Icon(
                              Icons.movie,
                              size: 50,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartoon.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      " ${cartoon.year}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      " ${cartoon.rating}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                        left: 32,
                                        right: 32,
                                      ),
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 6,
                                        bottom: 6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.slow_motion_video,
                                            color: Color(0xff38404b),
                                            size: 24,
                                          ),
                                          Text(
                                            " Start Watching",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              // 40 list items
              childCount: context.watch<MoviesProvider>().cartoons.length,
            ),
          ),
        ],
      ),
    );
  }
}
