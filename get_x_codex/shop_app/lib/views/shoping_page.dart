import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/controllers/cart_controller.dart';
import 'package:shop_app/controllers/shopping_controller.dart';
import 'package:shop_app/models/product.dart';

class ShoppingPage extends StatelessWidget {
  // Initialisation du controller
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          title: Text('Shopping GetX'),
          backgroundColor: Colors.teal[100],
          elevation: 0,
        ),
        body: Column(children: [
          Expanded(
            //************************* Avec ObX ******************************/
            child: Obx(() {
              return ListView.builder(
                  itemCount: shoppingController.products.length,
                  itemBuilder: (context, index) {
                    var product = shoppingController.products[index];
                    return Card(
                      elevation: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(padding: EdgeInsets.all(10)),
                                Text(
                                  '${product.productName}',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Text('${product.productDescription}'),
                                Padding(padding: EdgeInsets.all(10)),
                              ]),
                          Column(
                            children: <Widget>[
                              Text(
                                "${product.price} \$",
                                style: TextStyle(fontSize: 25),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.teal[300])),
                                child: Text(
                                  "Ajouter",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () =>
                                    {cartController.addToCart(product)},
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove), 
                                    onPressed: () {
                                      product.quantity.value--;
                                    }
                                  ),


                                  Obx(() =>Text('${product.quantity}')),
                                  IconButton(
                                    icon: Icon(Icons.add), 
                                    onPressed: () {
                                      product.quantity.value++;
                                    }
                                  ),
                                ],
                              ),
                              Obx(() => IconButton(
                                  icon: !shoppingController
                                          .products[index].isFavorite.value
                                      ? Icon(Icons.favorite_border)
                                      : Icon(Icons.favorite_sharp),
                                  onPressed: () {
                                    shoppingController
                                        .products[index].isFavorite
                                        .toggle();
                                  })),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            }
          ),

            //************************ AVEC GetX *******************************/
            // child: GetX<ShoppingController>(builder: (controller) {
            //   return ListView.builder(
            //       itemCount: controller.products.length,
            //       itemBuilder: (context, index) {
            //         var product = controller.products[index];
            //         return Card(
            //           elevation: 3,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceAround,
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children : <Widget>[
            //                   Padding(padding: EdgeInsets.all(10)),
            //                   Text('${product.productName}', style: TextStyle(fontSize: 25),),
            //                   Padding(padding: EdgeInsets.all(10)),
            //                   Text('${product.productDescription}'),
            //                   Padding(padding: EdgeInsets.all(10)),
            //                 ]
            //               ),
            //               Column(
            //                 children: <Widget>[
            //                   Text("${product.price} \$",style: TextStyle(fontSize: 25),),
            //                   ElevatedButton(
            //                     style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.teal[300])),
            //                     child: Text("Ajouter", style: TextStyle(color: Colors.white),),
            //                     onPressed: () => {
            //                       cartController.addToCart(product)
            //                     },

            //                   )
            //                 ],
            //               )
            //             ],
            //           ),
            //         );
            //       }
            //     );
            //   }
            // ),
          ),
          //********************* Implementation ObX **************************/
          //*******************************************************************/
          Obx(() {
            return Text('Total Amount: ${cartController.cartItemCount}');
          }),
          Obx(() {
            return SizedBox(
              height: 100,
              child: Text('Prix : ${cartController.totalPrice}'),
            );
          })
          //********************* Implementation GetBuilder *******************/
          //*******************************************************************/
          // Inutile de faire des variables .obs observable dans le controller
          // avec getBuilder.
          // GetBuilder<CartController>(
          //   builder: (controller) {
          //     return Text('Total Amount: ${cartController.cartItemCount}');
          //   }
          // ),
          // GetBuilder<CartController>(
          //   builder: (controller) {
          //     return SizedBox(
          //       height: 100,
          //       child: Text('Prix : ${cartController.totalPrice}'),
          //     );
          //   }
          // ),
          //*******************************************************************/
          //*******************************************************************/
          //********************* Implementation GetX *************************/
          //*******************************************************************/
          // GetX<CartController>(
          //   builder: (controller) {
          //     return Text('Total Amount: ${cartController.cartItemCount}');
          //   }
          // ),
          // GetX<CartController>(
          //   builder: (controller) {
          //     return SizedBox(
          //       height: 100,
          //       child: Text('Prix : ${cartController.totalPrice}'),
          //     );
          //   }
          // )
          //*******************************************************************/
          //*******************************************************************/
        ]),
        floatingActionButton:
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {
              shoppingController.products.add(Product(
                id: 2,
                price: 47,
                productDescription: 'Une description',
                productImage: 'exx',
                productName: 'Second Product',
                //isFavorite: false,
              ))
            },
        )

        // floatingActionButton: GetX<ShoppingController>(builder: (controller) {
        //   return FloatingActionButton(
        //     backgroundColor: Colors.teal[300],
        //     child: Icon(Icons.add),
        //     onPressed: () => {
        //       shoppingController.addNewProduct(Product(
        //         id: 2,
        //         price: 47,
        //         productDescription: 'Une description',
        //         productImage: 'exx',
        //         productName: 'Second Product',
        //         //isFavorite: false,
        //       ))
        //     },
        //   );
        // }
        );
  }
}
