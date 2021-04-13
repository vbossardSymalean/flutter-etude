import 'package:get/route_manager.dart';
import 'package:getx_hive_project/pages/home/index.dart';

routes() => [
  GetPage(name: "/", page: () => Home()),
  //GetPage(name: "products/:id", page: () => Product()),
  //GetPage(name: "/cart", page: () => Cart()),
];
