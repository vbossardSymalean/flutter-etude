import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:getx_hive_project/models/cart_item.model.dart';

class AppController extends GetxController {
  RxList<CartItemModel> cartItems = RxList<CartItemModel>([]);
}
