import 'package:get/state_manager.dart';
import 'package:shop_app/models/product.dart';

class ShoppingController extends GetxController {
  // Rendre la liste observable.
  RxList<Product> products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResponse = [
      Product(
        id: 1,
        price: 30,
        productDescription: 'Une description',
        productImage: 'exx',
        productName: 'First Product',
      ),
      Product(
        id: 2,
        price: 47,
        productDescription: 'Une description',
        productImage: 'exx',
        productName: 'Second Product',
      ),
      Product(
        id: 3,
        price: 89,
        productDescription: 'Une description',
        productImage: 'exx',
        productName: 'Third Product',
      ),
    ];

    products.value = productResponse;
  }

  void addNewProduct(Product product) {
    products.add(product);
  }

}
