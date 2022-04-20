import 'package:flutter/material.dart';
import 'package:myflutterapp/constants.dart';
import 'package:myflutterapp/model/itemcart.dart';
import 'package:myflutterapp/providers/cart_operations.dart';
import 'package:provider/provider.dart';

class CardItem extends StatelessWidget {
  const CardItem({Key? key, required this.item}) : super(key: key);

  final ItemCart item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
              child: Image.asset(
            item.image,
            // height: 400,
            fit: BoxFit.cover,
            width: 150,
            // width: double.infinity,
          )),
          Column(
            children: [
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                item.desc,
                maxLines: 1,
                style: const TextStyle(color: bodyTextColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () {
                          Provider.of<CartOperation>(context, listen: false)
                              .decreaseNumItem(item.name);
                        },
                        child: const Text("-"),
                      ),
                      Text(item.num.toString()),
                      TextButton(
                        onPressed: () {
                          Provider.of<CartOperation>(context, listen: false)
                              .increaseNumItem(item.name);
                        },
                        child: const Text("+"),
                      ),
                    ],
                  ),
                  Text("Rp." + (item.price * item.num).toString()),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
