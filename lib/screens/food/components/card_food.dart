import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';
import 'package:myflutterapp/providers/cart_operations.dart';
import 'package:provider/provider.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    Key? key,
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
  }) : super(key: key);

  final String image;
  final String name;
  final String desc;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Image.asset(
          image,
          // height: 400,
          fit: BoxFit.cover,
          width: double.infinity,
        )),
        //prefer use SizedBox over wrapping the widget in Padding, because more readable when rendering widget
        const SizedBox(height: defaultPadding / 2),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline6,
        ),
        Text(
          desc,
          maxLines: 1,
          style: const TextStyle(color: bodyTextColor),
        ),
        DefaultTextStyle(
          style: TextStyle(color: Colors.black, fontSize: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Rp." + price.toString()),
              IconButton(
                  onPressed: () {
                    Provider.of<CartOperation>(context, listen: false)
                        .addItemCart(name, desc, image, price);
                  },
                  icon: const Icon(Icons.add_shopping_cart))
            ],
          ),
        ),
      ],
    );
  }
}
