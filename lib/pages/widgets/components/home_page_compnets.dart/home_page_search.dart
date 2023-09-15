import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomePageSearch extends StatefulWidget {
  const HomePageSearch({
    super.key,
    required Locale locale,
    required BuildContext context,
  });

  @override
  State<HomePageSearch> createState() => _HomePageSearchState();
  
}
class _HomePageSearchState extends State<HomePageSearch> {
  Future<void> refreshTran() async {
     context.setLocale(context.locale);
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator (
      onRefresh: refreshTran,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            // showSearch(context: context, delegate: Cusdele)
          },
          child: AbsorbPointer(
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(220, 255, 255, 255),
                border: OutlineInputBorder(),
                hintText: tr("placeholder"),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: IconButton(
                      onPressed: () {
                      },
                    icon: const Icon(Icons.search,size: 20,),
                    color: Colors.white,
                    ),
                  ),
                )
              ),
            ),
          ),
        ),
      ),
    );
  }
}