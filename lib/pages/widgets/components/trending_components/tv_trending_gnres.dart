import 'package:flutter/material.dart';
import 'package:movie/getsFunc/get_genres_name.dart';
import 'package:movie/models/tv_tending_model.dart';
import 'package:movie/service/data_provider.dart';
import 'package:movie/utils/text_styles.dart';

class TvTrendingGenres extends StatelessWidget {
  const TvTrendingGenres({
    super.key,
    required this.genresProvider,
    required this.tvTrending,
  });

  final DataProvider genresProvider;
  final TvTrending tvTrending;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        getGenreNames(genresProvider, tvTrending.genreIds),
        style: MovieGenderTextFeature.movieGenderTitleStyle,
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
