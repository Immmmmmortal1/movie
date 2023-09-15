import 'package:flutter/material.dart';
import 'package:movie/utils/text_styles.dart';

AppBar customAppbar(BuildContext context, String projectName) {
  return AppBar(
    title: Text(projectName, style: ProjectStyle.welcomeStyle,),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Image.asset('assets/images/menuicon.png'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Colors.black),
          ),
          child: IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.person),
            iconSize: 24,
            padding: EdgeInsets.zero,
          ),
        ),

        )
    ],
  );
}