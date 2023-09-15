import 'package:flutter/material.dart';
import 'package:movie/models/movie_api_model.dart';
import 'package:movie/utils/colors.dart';

class RatingAndLanguage extends StatelessWidget {

const RatingAndLanguage({Key? key, required this.size, required this.movie, required this.unknow, required this.language}) : super(key: key);

final Size size;
final MovieModel movie;
final String unknow;
final String language;

  @override
  Widget  build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.4,
      child: Stack(
        children: <Widget>[
          Container(
            height: size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              image: movie.posterPath != null
                  ? DecorationImage(
                      image: NetworkImage(
                        'https://image.tmdb.org/t/p/w200/${movie.posterPath}',
                      ),
                      fit: BoxFit.cover,
                    )
                  : null,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size.width * 0.9,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 5),
                    blurRadius: 50,
                    color: ColorsItems.footerGrey
                  )
                ]
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star,color: Colors.yellow,),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan
                            ]
                          ))
                      ],
                    )
                    ),
                  // Expanded(child: child),
                ]
              ) ,
            ),
          )
        ]
      ),
    )
  }
}