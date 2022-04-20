import 'package:flutter/cupertino.dart';
import 'package:myflutterapp/model/itemcart.dart';

class CartOperation with ChangeNotifier {
  List<ItemCart> _itemsCart = [];

  List<ItemCart> get getItemsCart => _itemsCart;

  void addItemCart(String name, String desc, String image, int price) {
    bool exists = _itemsCart.any((element) => element.name == name);
    if (exists) {
      increaseNumItem(name);
    } else {
      ItemCart itemCart = ItemCart(name, desc, image, price, 1);
      _itemsCart.add(itemCart);
      notifyListeners();
    }
  }

  void increaseNumItem(String name) {
    _itemsCart.forEach((e) => {
          if (e.name == name) {e.num = e.num + 1}
        });

    notifyListeners();
  }

  void decreaseNumItem(String name) {
    _itemsCart.forEach((e) => {
          if (e.name == name && e.num > 0) {e.num = e.num - 1}
        });
    _itemsCart
        .removeWhere((element) => element.name == name && element.num == 0);

    notifyListeners();
  }
}
