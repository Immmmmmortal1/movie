import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/widgets/components/home_page_compnets.dart/home_page_image.dart';
import 'package:movie/pages/widgets/components/home_page_compnets.dart/home_page_search.dart';
import 'package:movie/pages/widgets/components/home_page_compnets.dart/home_page_title_subtitle.dart';
import 'package:movie/pages/widgets/components/whats_popular_componets/whats_popular_widget.dart';

const projectName = 'MUVIME';

class CustomStackWidgets extends StatelessWidget {
  const CustomStackWidgets({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomePageImage(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox( height: 30),
            HomePageSearch(locale: context.locale, context: context),
            HomePageTitleAndSubtitleButton(locale: context.locale, context: context),
            WhatsPopularWidget(
              locale: context.locale,
              context: context,
            ),
          ]
        )
      ],
    );
  }
}