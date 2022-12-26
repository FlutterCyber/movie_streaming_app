import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:movie_streaming_app/models/serie_model.dart';
import 'package:movie_streaming_app/player/player.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';
import 'package:share_plus/share_plus.dart';

class SerieScreen extends StatefulWidget {
  const SerieScreen({Key? key, required this.serie}) : super(key: key);
  final SerieModel serie;

  @override
  State<SerieScreen> createState() => _SerieScreenState();
}

class _SerieScreenState extends State<SerieScreen> {
  bool showInfo = false;

  @override
  Widget build(BuildContext context) {
    String genre = "";

    if (widget.serie.isAction) {
      genre = "Action";
    } else if (widget.serie.isComedic) {
      genre = "Comedic";
    } else if (widget.serie.isDrama) {
      genre = "Drama";
    } else if (widget.serie.isFantastic) {
      genre = "Fantastic";
    } else if (widget.serie.isHorror) {
      genre = "Horror";
    } else if (widget.serie.isThriller) {
      genre = "Thriller";
    } else {
      genre = '';
    }

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff38404b).withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: const Color(0xff38404b),
        title: Text(widget.serie.name),
        actions: [
          IconButton(
            onPressed: () {
              Share.share(
                  '${widget.serie.name} \nYear: ${widget.serie.year} | Rating: ${widget.serie.rating}\n\nWatch in WatchMe! \nhttps://fluttuz.t.me');
            },
            icon: const Icon(
              Icons.share,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
              ),
              child: SizedBox(
                height: h * 0.3,
                width: w,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage(
                        width: w * 0.3,
                        fit: BoxFit.cover,
                        imageUrl: widget.serie.imgUrl,
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
                        padding: const EdgeInsets.only(
                          left: 12,
                          top: 10,
                          right: 4,
                          bottom: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            infoWidget(Icons.local_movies_rounded,
                                "Season ${widget.serie.season}"),
                            infoWidget(Icons.calendar_month, widget.serie.year),
                            infoWidget(
                                Icons.star, widget.serie.rating.toString()),
                            infoWidget(Icons.video_collection_outlined,
                                "${widget.serie.videoUrls.length} Episode"),
                            infoWidget(
                              Icons.movie_creation_outlined,
                              genre,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 12),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    showInfo = !showInfo;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      showInfo ? Icons.close : Icons.info_outline,
                      color: Colors.red,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      showInfo
                          ? "Close"
                          : """More info about "${widget.serie.name}\"""",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: showInfo
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                    ),
                    child: Text(
                      widget.serie.title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Player(
                          vd_url: widget.serie.videoUrls[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 10,
                    ),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 10,
                      top: 8,
                      bottom: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xff38404b),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          IconlyBold.play,
                          color: Colors.red,
                          size: 36,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Chapter ${index + 1}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              // 40 list items
              childCount: widget.serie.videoUrls.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget infoWidget(icon, info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.red,
          size: 30,
        ),
        const SizedBox(width: 8),
        Text(
          "$info",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
