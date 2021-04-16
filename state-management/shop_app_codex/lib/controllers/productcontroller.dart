import 'package:get/state_manager.dart';
import 'package:shop_app_codex/models/product.dart';
import 'package:shop_app_codex/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  RxList productList = [].obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    
    try {
      isLoading(true);
      var products = await RemoteServices.fetchProducts();
      if (products != null) {
        productList.value = products;
      }
    } catch (e) {

    }finally {
      isLoading(false);
    }
    
    
  }
}
