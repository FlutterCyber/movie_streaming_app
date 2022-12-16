import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_streaming_app/models/movie_model.dart';
import 'package:movie_streaming_app/providers/download_manager.dart';
import 'package:movie_streaming_app/screens/loading_widget.dart';

class DownloadItemScreen extends StatelessWidget {
  const DownloadItemScreen({
    required this.movie,
    Key? key,
  }) : super(key: key);
  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 8,
      ),
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 8,
        bottom: 8,
      ),
      height: h * 0.18,
      width: w,
      decoration: BoxDecoration(
        color: const Color(0xff38404b),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: h * 0.16,
            height: h * 0.16,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: movie.imgUrl,
                placeholder: (context, url) => Loading.loading(),
                errorWidget: (context, url, error) => const Icon(
                  Icons.movie,
                  size: 50,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  movie.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                StreamBuilder<double>(
                  stream: DownloadManager.instance
                      .getMovieDownloadProgress(movie),
                  builder: (context, snapshot) {
                    double? progress = snapshot.data;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${((progress ?? 0) * 100).toInt()}%  ",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: w - h * 0.31,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.grey,
                            color: Colors.red,
                            value: progress,
                            semanticsLabel: 'Downloading progress',
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          child: const Icon(Icons.close, color: Colors.grey),
                          onTap: () {
                            DownloadManager.instance
                                .cancelDownloading(movie);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.red,
                                content: Text('Movie successfully canceled!'),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 2),
                      ],
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
