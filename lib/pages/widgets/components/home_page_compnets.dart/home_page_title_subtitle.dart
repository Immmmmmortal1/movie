import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/utils/text_styles.dart';

class HomePageTitleAndSubtitleButton  extends StatefulWidget {
  const HomePageTitleAndSubtitleButton({
     Key? key,
    required Locale locale,
    required BuildContext context,
  }) : super(key: key);
  @override
  State<HomePageTitleAndSubtitleButton> createState() => _HomePageTitleAndSubtitleButtonState();
}
class _HomePageTitleAndSubtitleButtonState extends State<HomePageTitleAndSubtitleButton> {
  Future <void> refreshTran() async {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refreshTran,
      child: Column(
        crossAxisAlignment:  CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: Text(
              tr('peaky_blinders'),
              style: TitleTextFeature.titlestyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Text(
              tr('john_wick_description'),
              style: SubtitleTextFeature.titlestyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 10),
            child: ElevatedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.play_circle_fill,size: 24.0,), 
              label: Text(
                tr('watch_trial'),
                style: WatchTrialTextFeature.watchTrialtitlestyle),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            )
        ]
      ),
    );
  }
}