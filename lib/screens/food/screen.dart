import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';
import 'package:myflutterapp/demoData.dart';
import 'package:myflutterapp/screens/food/components/card_food.dart';

import 'components/category.dart';
import 'components/search_box.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        SearchBox(
          onChanged: (String value) {},
        ),
        Category(),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(defaultPadding),
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            children: List.generate(
                cardFoodData.length,
                (index) => CardFood(
                    image: cardFoodData[index]['image'],
                    name: cardFoodData[index]['name'],
                    desc: cardFoodData[index]['desc'],
                    price: cardFoodData[index]['price'])),
          ),
        ),
      ],
    ));
  }
}
