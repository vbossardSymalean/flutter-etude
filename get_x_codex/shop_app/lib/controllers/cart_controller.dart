import 'package:get/state_manager.dart';
import 'package:shop_app/models/product.dart';

class CartController extends GetxController {
  RxInt cartTotal = 0.obs;

  RxList<Product> cartItems = <Product>[].obs;

  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  int get cartItemCount => cartItems.length;

  void addToCart(Product product) {
    cartItems.add(product);
  }

  // int cartItemCount() {
  //   return cartItems.length;
  // }

  //Mauvaise façon
  double cartTotalPrice() {
    double cartTotal = 0;

    cartItems.forEach((item) {
      cartTotal += item.price;
    });
    return cartTotal;
  }
}
