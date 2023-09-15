import 'package:flutter/material.dart';
import 'package:movie/models/movie_api_model.dart';
import 'package:movie/pages/home_page.dart';
import 'package:movie/pages/widgets/app_bar_widgets.dart';

class FilmDetailPage extends StatefulWidget {
  final MovieModel movie;

  const FilmDetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(context, projectName),
      body: ,
    )
  }
}