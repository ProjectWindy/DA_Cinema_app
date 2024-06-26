import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pine/features/movies/presentation/movie_details_main.dart';

class MovieCardMain extends StatelessWidget {
  final Map movieDetails;
  const MovieCardMain({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetailsMain(movie: movieDetails)));
      },
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Card(
                elevation: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                      imageUrl: movieDetails["Poster_Url"],
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5, right:5),
                                  child: LinearProgressIndicator(
                                      value: downloadProgress.progress),
                                ),
                              )),
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                movieDetails["Title"],
                style: theme.textTheme.labelSmall,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
