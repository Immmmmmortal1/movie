import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/models/movie_api_model.dart';
import 'package:movie/pages/widgets/components/file_detail_component/filem_detaile_cast.dart';
import 'package:movie/pages/widgets/components/file_detail_component/filem_genre_detaile.dart';
import 'package:movie/pages/widgets/components/file_detail_component/filem_rating_and_language.dart';
import 'package:movie/pages/widgets/components/file_detail_component/filme_title_watchbtn.dart';
import 'package:movie/pages/widgets/components/footer_components/footer_widgets.dart';
import 'package:movie/pages/widgets/components/footer_components/sub_footer_widget.dart';
import 'package:movie/service/data_provider.dart';
import 'package:provider/provider.dart';

class DetailBody extends StatefulWidget {
  final MovieModel movie;

  const DetailBody({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends State<DetailBody> {
  late DataProvider requestsProvider;
  late DataProvider genresProvider;

  @override
  Widget build(BuildContext context) {
    requestsProvider = Provider.of<DataProvider>(context, listen: false);
    genresProvider = Provider.of<DataProvider>(context, listen: false);

    const String unknown = 'unknown';
    const String language = 'Original Language';

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

        children: [
           RatingAndLanguage(
            size: size,
            movie: widget.movie,
            unknow: unknown,
            language: language,
          ),
          TitleYearGenresWatchBtn(movie: widget.movie),
          FileMGenreDetaile(selectedMovie: widget.movie),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Text(
              tr('Cast'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ),
            FilemDetailCast(movie: widget.movie),
            Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Text(
              tr('summary'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(widget.movie.overview ?? 'Unknown Overview'),
          ),
          const SizedBox(height: 30),
          NewFooterWidget(
            locale: context.locale,
            context: context,
          ),
          SubFoooterWidget(
            locale: context.locale,
            context: context,
          ),

          // titleyea
        ]
      ),
    );
    }

  }