import 'package:get/get.dart';
import 'package:getx_hive_project/models/product.model.dart';

class CartItemModel {
  CartItemModel({ProductModel product, int quantity}) {
    this.product = product;
    this.quantity = quantity;
  }

  // Définition des propriétés avec GETx
  Rx<ProductModel> _product = ProductModel().obs;
  // Setter
  set product(ProductModel value) => _product.value = value;
  // Getter
  ProductModel get product => _product.value;

  RxInt _quantity = 0.obs;
  // Setter
  set quantity(int value) => _quantity.value = value;
  // Getter
  int get quantity => _quantity.value;

  // Methods

  incrementQuantity() {
    if (this.quantity >= 10) {
      this.quantity = 10;
    } else {
      this.quantity += 1;
    }
  }

  decrementQuantity() {
    if (this.quantity <= 1) {
      this.quantity = 1;
    } else {
      this.quantity -= 1;
    }
  }
}
