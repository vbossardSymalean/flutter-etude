import 'package:flutter/material.dart';
import 'package:shop_app_codex/models/product.dart';

class ProductTile extends StatelessWidget {
  ProductTile({@required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(4)),
                    child: Image.network(product.imageLink, fit: BoxFit.cover),
                  )
                ],
              )
            ],
          )),
    );

    // return Container(
    //   child: Text(product.name),
    //   height: 100,
    //   width: 100,
    // );
  }
}
