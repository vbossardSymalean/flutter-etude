


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive_project/models/product.model.dart';
import 'package:getx_hive_project/shared/utils/colors.dart';

class ItemLike extends StatelessWidget {
  final ProductModel product;
  ItemLike(this.product);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: SizedBox(
        width: 40,
        height: 40,
        child: FlatButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
          ),
          child: Obx(() {
            return Icon(
              Icons.thumb_up_alt,
              //Feather.heart,
              size: 21,
              color: product.like ? AppColors.GREEN : AppColors.LIGHT_GREY,
            );
          }),
          onPressed: () => product.like = !product.like,
        ),
      ),
    );
  }
}