import 'package:flutter/material.dart';
import 'package:movie/models/movie_api_model.dart';
import 'package:movie/utils/colors.dart';

class TitleYearGenresWatchBtn extends StatelessWidget {
 final MovieModel movie;

  const TitleYearGenresWatchBtn({
    Key? key,
    required this.movie,
  }) : super(key: key);

@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(25),
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                        movie.title ?? '',
                        style: Theme.of(context).textTheme.headlineSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
              Text(
                      movie.releaseDate != null
                          ? ' ${DateTime.parse(movie.releaseDate!).year.toString()}  '
                          : '',
                    ),
            ]
          )
        ),
        SizedBox(
          height: 64,
          width: 64,
          child: TextButton(
          onPressed: () {
            
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
          ),
          child: const Icon(Icons.bookmark, color: Colors.white,)
          ),
        )
      ],
    )
    );
  }
}
