import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Feature Partners", style: Theme.of(context).textTheme.headline6),
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(primary: activeColor),
          child: const Text("See all"),
        )
      ],
    );
  }
}
