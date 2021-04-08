import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:state_management_lesson/model/Item.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];
  int _incrementTest = 0;
  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => 1000;
  int get number => _incrementTest;
  

  /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  /// cart from the outside.
  void add(Item item) {
    _items.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void incrementIt () {
    _incrementTest++;
    notifyListeners();
  }
}
