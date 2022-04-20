import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';

class CardRestaurant extends StatelessWidget {
  const CardRestaurant({
    Key? key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.delivertTime,
  }) : super(key: key);

  final String image;
  final String name;
  final String location;
  final double rating;
  final int delivertTime;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      onTap: () {},
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.25,
              child: Image.asset(image),
            ),
            //prefer use SizedBox over wrapping the widget in Padding, because more readable when rendering widget
            SizedBox(height: defaultPadding / 2),
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              location,
              maxLines: 1,
              style: TextStyle(color: bodyTextColor),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
              child: DefaultTextStyle(
                style: TextStyle(color: Colors.black, fontSize: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding / 2,
                          vertical: defaultPadding / 8),
                      decoration: BoxDecoration(
                          color: activeColor,
                          borderRadius: BorderRadius.all(Radius.circular(6))),
                      child: Text(rating.toString(),
                          style: TextStyle(color: Colors.white)),
                    ),
                    Text(delivertTime.toString() + " min"),
                    Text("Free delivery")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
