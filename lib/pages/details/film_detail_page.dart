import 'package:flutter/material.dart';
import 'package:movie/models/movie_api_model.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/widgets/app_bar_widgets.dart';
import 'package:movie/pages/widgets/components/file_detail_component/filem_detail_body.dart';

class FilmDetailPage extends StatelessWidget {
  final MovieModel movie;

  const FilmDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, projectName),
      body: DetailBody(movie: movie),
    );
  }
}