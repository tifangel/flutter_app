import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';

class HeaderSliver extends StatelessWidget {
  const HeaderSliver({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        children: [
          Text(
            "Delivery to".toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: activeColor),
          ),
          const Text(
            "San Francisco",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Filter",
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
