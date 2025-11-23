import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:store_app_template/model/item_model.dart';

class CartModel extends ChangeNotifier {
  final List<ItemModel> _shopItems = [
    ItemModel(itemTitle: 'Grape', itemPrice: 4.08, imagePath: 'images/grape.jpg', color: Colors.deepPurple),
    ItemModel(itemTitle: 'Apple', itemPrice: 5.3, imagePath: 'images/apple.jpg', color: Colors.red),
    ItemModel(itemTitle: 'Banana', itemPrice: 3.5, imagePath: 'images/banana.jpg', color: Colors.yellow),
    ItemModel(itemTitle: 'Orange', itemPrice: 6.4, imagePath: 'images/orange.jpg', color: Colors.orange),
  ];

  final List<ItemModel> _cartItems = [];

  get getItemCount => _shopItems.length;
   
  UnmodifiableListView<ItemModel> get getShopItems {
    return UnmodifiableListView(_shopItems);
  }

  UnmodifiableListView<ItemModel> get getCartItems {
    return UnmodifiableListView(_cartItems);
  }

  void addItemToCart(int index) {
    if(_cartItems.contains(_shopItems[index])) {
      _shopItems[index].quantity += 1;
    } else {
      _cartItems.add(_shopItems[index]);
    }
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void increaseQuantity(int index) {
    _cartItems[index].quantity += 1;
    notifyListeners();
  }

  void decreaseQuantity(int index) {
    if(_cartItems[index].quantity > 0) {
      _cartItems[index].quantity -= 1;
    }
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for(var item in _cartItems) {
      totalPrice += item.itemPrice * item.quantity;
    }
    return totalPrice.toStringAsFixed(2);
  }
}