import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shop_app_codex/controllers/productcontroller.dart';
import 'package:shop_app_codex/views/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
        actions: [
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.black),
              onPressed: null)
        ],
      ),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    'ShopX',
                    style: TextStyle(
                        fontFamily: 'avenir',
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.view_list_rounded, color: Colors.black),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.grid_view, color: Colors.black),
                  onPressed: null,
                )
              ],
            )),
        Expanded(
          child: Obx(() {
            if (productController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
            return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  // return Container(
                  //   height: 100,
                  //   width: 100,
                  //   color: Colors.red,
                  // );
                  return ProductTile(
                      product: productController.productList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1));
          }),
        )
      ]),
    );
  }
}
