import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/getsFunc/get_genres_name.dart';
import 'package:movie/models/movie_api_model.dart';
import 'package:movie/service/data_provider.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:provider/provider.dart';

class FileMGenreDetaile extends StatelessWidget {
    final MovieModel selectedMovie;

    const FileMGenreDetaile({Key? key, required this.selectedMovie}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      final genresProvider = Provider.of<DataProvider>(context, listen: false);
      String genreNames = getGenreNames(genresProvider, selectedMovie.genreIds);
        return Row(
            children: [
              Padding(padding: EdgeInsets.only(left:20)),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                padding: EdgeInsets.all(8.0),
                child: Text(
                  genreNames,
                  style: MovieGenderTextFeature.movieGenderTitleStyle,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  )
              )
            ]
        );
    }
    

}