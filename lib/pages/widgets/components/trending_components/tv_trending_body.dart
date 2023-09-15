import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/service/data_provider.dart';
import 'package:movie/utils/text_styles.dart';
import 'package:provider/provider.dart';

class FreeToWatchWidget extends StatefulWidget {
  const FreeToWatchWidget({
    Key? key,
    required Locale locale,
    required BuildContext context,
  }) : super(key: key);
  @override
  State<FreeToWatchWidget> createState() => _FreeToWatchWidgetState();
}
class _FreeToWatchWidgetState extends State<FreeToWatchWidget> {
  Future<void> refreshTranslations() async {
    await context.setLocale(context.locale);
  }

  @override
  Widget build(BuildContext context) {
    final requestsProvider = Provider.of<DataProvider>(context, listen: false);
    final genresProvider = Provider.of<DataProvider>(context, listen: false);
    return RefreshIndicator(
      onRefresh: refreshTranslations,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child:Text( 
                tr('free_to_watch'),
                style: MidSubTitleTextFeature.midSubTitleTextStyle,
            ),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 455,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: requestsProvider.tvTrendingItem?.length ?? 0,
                itemBuilder: (context, index) {
                  final movie = requestsProvider.tvTrendingItem![index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SizedBox(
                      width: 196,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              
                            },
                            child: AspectRatio(
                              aspectRatio: 196/293,
                              child: Card(
                                elevation: 2,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: movie.posterPath != null ? Image.network(
                                  'https://image.tmdb.org/t/p/w200/${movie.posterPath}'
                                , fit: BoxFit.cover) : const SizedBox.shrink(),
                              ),
                            ),
                          ),
                         ],
                      ),
                    ),
                  );
                }),
            ),

            )
        ],
      ), 
);
  }
}

class TvTrendingName {
}

class TvTrendingGenres {
}

class TvTrendingFilmTitle {
}