import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive_project/appWidgets/appbar_action.dart';
import 'package:getx_hive_project/pages/home/controller.dart';
import 'package:getx_hive_project/pages/home/widgets/list_categories.dart';
import 'package:getx_hive_project/pages/home/widgets/list_products.dart';
import 'package:getx_hive_project/appWidgets/custom_appbar.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
              // A changer
              backgroundColor: Colors.white,
              appBar: CustomAppBar(
                "GetX Concepts",
                actions: [
                  Obx(() => CustomAppBarAction(
                        () => Get.toNamed("/cart"),
                        Icons.shopping_cart,
                        // Feather.shopping_cart,
                        quantity: controller.cartQuantity,
                      ))
                ],
              ),
              body: CustomScrollView(slivers: <Widget>[
                SliverToBoxAdapter(
                  child: ListCategories(),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(
                    left: 25,
                    right: 25,
                    bottom: 25,
                  ),
                  sliver: HomeList(),
                )
              ]));
        });
  }
}
