
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie/pages/widgets/app_bar_widgets.dart';
import 'package:movie/pages/widgets/components/custom_stack_weidgts.dart';
import 'package:movie/pages/widgets/components/footer_components/footer_widgets.dart';
import 'package:movie/pages/widgets/components/footer_components/sub_footer_widget.dart';

const projectName = 'MUVIME';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppbar(context,projectName),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomStackWidgets(),
              const SizedBox(height: 20),
              NewFooterWidget(locale: context.locale, context: context),
              SubFoooterWidget(context: context, locale: context.locale)
            ],
          ),
        ),

      ));
  }
}