

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive_project/models/product.model.dart';
import 'package:getx_hive_project/shared/utils/colors.dart';

class ItemAdd extends StatelessWidget {
  final ProductModel product;
  ItemAdd(this.product);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: SizedBox(
        width: 40,
        height: 40,
        child: FlatButton(
          padding: EdgeInsets.zero,
          color: AppColors.LIGHT_GREEN,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: Icon(
            Icons.shopping_bag,
            // Feather.shopping_bag,
            size: 21,
            color: AppColors.WHITE,
          ),
          onPressed: () =>
              Get.toNamed("/products/${this.product.id.toString()}"),
        ),
      ),
    );
  }
}