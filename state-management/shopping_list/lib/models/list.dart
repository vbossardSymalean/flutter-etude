import 'package:flutter/foundation.dart';
import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/models/item.dart';

class ListModel extends ChangeNotifier {
  /// The private field backing [catalog].
  late ProductModel _product;

  /// Internal, private state of the cart. Stores the ids of each item.
  final List<int> _itemIds = [];

  /// The current catalog. Used to construct items from numeric ids.
  ProductModel get catalog => _product;

  set catalog(ProductModel newProduct) {
    _product = newProduct;
    // Notify listeners, in case the new catalog provides information
    // different from the previous one. For example, availability of an item
    // might have changed.
    notifyListeners();
  }

  /// List of items in the cart.
  List<Item> get items => _itemIds.map((id) => _product.getById(id)).toList();


  // List of all items in catalog
  List<String> get getList => _product.getList();


  int get itemCount => _itemIds.length;

  /// The current total price of all items.
  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  /// Adds [item] to cart. This is the only way to modify the cart from outside.
  void add(Item item) {
    _itemIds.add(item.id);
    // This line tells [Model] that it should rebuild the widgets that
    // depend on it.
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    // Don't forget to tell dependent widgets to rebuild _every time_
    // you change the model.
    notifyListeners();
  }
}
