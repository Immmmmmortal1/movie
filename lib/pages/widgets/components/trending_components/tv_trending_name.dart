import 'package:flutter/material.dart';
import 'package:movie/models/tv_tending_model.dart';
import 'package:movie/utils/text_styles.dart';

class TvTrendingName extends StatelessWidget {
  const TvTrendingName({
    super.key,
    required this.tvTrending,
  });

  final TvTrending tvTrending;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        tvTrending.name ?? 'Undefined',
        style: HomeFilmTextFeature.homeFilmTextFeatureStyle,
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}