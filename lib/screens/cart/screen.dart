import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';
import 'package:myflutterapp/providers/cart_operations.dart';
import 'package:provider/provider.dart';

import 'components/card_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var u = Provider.of<CartOperation>(context);
    var totalPrice = u.getItemsCart.length > 0
        ? u.getItemsCart
            .map((e) => e.num * e.price)
            .reduce((value, element) => value + element)
        : 0;

    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          child: Consumer<CartOperation>(
            builder: (context, value, child) => ListView.builder(
                itemCount: value.getItemsCart.length,
                itemBuilder: (context, index) {
                  return CardItem(item: value.getItemsCart[index]);
                }),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: defaultPadding),
          child: Text("Rp " + totalPrice.toString()),
        ),
        Container(
          padding: EdgeInsets.all(defaultPadding),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Order",
                style: TextStyle(
                    color: bgColor, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              style: TextButton.styleFrom(
                  backgroundColor: accentColor,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  side: BorderSide(color: accentColor),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25))),
            ),
          ),
        ),
      ]),
    );
  }
}
