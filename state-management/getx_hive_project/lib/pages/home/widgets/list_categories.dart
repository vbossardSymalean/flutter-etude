import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive_project/models/category.model.dart';
import 'package:getx_hive_project/pages/home/controller.dart';
import 'package:getx_hive_project/pages/home/widgets/item_categories.dart';

class ListCategories extends StatelessWidget {
  final HomeController controller = Get.find();

  ListCategories();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(width: 100),
          itemCount: controller.categories.length,
          itemBuilder: (_, index) {
            CategoryModel category = controller.categories.elementAt(index);
            return Obx(() {
              return ItemCategories(
                category,
                category == controller.selectedCategory,
              );
            });
          },
        ),
      );
    });
  }
}
