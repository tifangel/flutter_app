import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';

AppBar homeBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: IconButton(
      color: secondaryColor,
      onPressed: () {},
      icon: const Icon(Icons.menu),
    ),
    title: Column(
      children: [
        Text(
          "Order from".toUpperCase(),
          style:
              Theme.of(context).textTheme.caption!.copyWith(color: activeColor),
        ),
        RichText(
            text: const TextSpan(
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                children: [
              TextSpan(
                text: "Pali",
                style: TextStyle(color: accentColor),
              ),
              TextSpan(
                text: "Food",
                style: TextStyle(color: secondaryColor),
              ),
            ]))
      ],
    ),
    actions: [
      IconButton(
        color: secondaryColor,
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      )
    ],
  );
}
