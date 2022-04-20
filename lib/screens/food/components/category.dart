import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';
import 'package:myflutterapp/demoData.dart';

class Category extends StatefulWidget {
  const Category({
    Key? key,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: Row(
          children: List.generate(
            categories.length,
            (index) => Padding(
                padding: EdgeInsets.only(
                    left: defaultPadding,
                    right: index == categories.length - 1 ? defaultPadding : 0),
                child: CategoryItem(
                  name: categories[index],
                  active: _currentIndex == index,
                  onPressed: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                )),
          ),
        ));
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.name,
    required this.active,
    required this.onPressed,
  }) : super(key: key);

  final String name;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child:
          Text(name, style: TextStyle(color: active ? bgColor : accentColor)),
      style: TextButton.styleFrom(
          backgroundColor: active ? accentColor : bgColor,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          side: BorderSide(color: accentColor),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
    );
    // Container(
    //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    //   decoration: BoxDecoration(
    //     color: accentColor,
    //     border: Border.all(color: accentColor, style: BorderStyle.solid),
    //     borderRadius: BorderRadius.circular(25),
    //   ),
    //   child: Text(name),
    // ),
  }
}
