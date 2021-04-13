import 'package:shopping_list/models/item.dart';

/// A proxy of the catalog of items the user can buy.
///
/// In a real app, this might be backed by a backend and cached on device.
/// In this sample app, the catalog is procedurally generated and infinite.
///
/// For simplicity, the catalog is expected to be immutable (no products are
/// expected to be added, removed or changed during the execution of the app).
class ProductModel {
  static List<String> itemNames = [
    'Tomate',
    'Pate',
    'Saumon',
    'Steack',
    'Salade',
    'Crevette',
    'Papier Toilette',
    'Huile',
    'Poivre',
    'Courgette',
    'Poivron',
    'Riz',
    'Litière',
    'Nourriture Chat',
    'Dentifrice',
  ];

  /// Get item by [id].
  ///
  /// In this sample, the catalog is infinite, looping over [itemNames].
  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  /// Get item by its position in the catalog.
  Item getByPosition(int position) {
    // In this simplified case, an item's position in the catalog
    // is also its id.
    return getById(position);
  }

  List<String> getList() => itemNames;
}
