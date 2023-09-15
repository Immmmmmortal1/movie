import 'package:flutter/material.dart';
import 'package:movie/pages/widgets/components/file_detail_component/filem_rating_and_language.dart';
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
          // titleyea
        ]
      ),
    );
    }

  }