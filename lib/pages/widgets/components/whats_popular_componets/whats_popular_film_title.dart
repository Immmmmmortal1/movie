import 'package:flutter/material.dart';
import 'package:movie/models/movie_api_model.dart';
import 'package:movie/utils/text_styles.dart';

class WhatsPopularFilmTitle extends StatelessWidget {
  const WhatsPopularFilmTitle({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        movie.title ?? '',
        style: HomeFilmTextFeature.homeFilmTextFeatureStyle,
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
