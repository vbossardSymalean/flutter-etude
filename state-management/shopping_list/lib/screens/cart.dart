import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/cart.dart';

class MyCart extends StatelessWidget {
  // Rendu de la vue *****************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Cart',
            style: Theme.of(context).textTheme.headline1,
          ),
          backgroundColor: Colors.white,
        ),
        body: Container(
            color: Colors.yellow,
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: _CardList(),
                )),
                Divider(height: 4, color: Colors.black),
                _CartTotal()
              ],
            )));
  }
}

class _CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNamedStyle = Theme.of(context).textTheme.headline6;
    var cart = context.watch<CartModel>();

    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                cart.remove(cart.items[index]);
              },
            ),
            title: Text(
              cart.items[index].name,
              style: itemNamedStyle,
            )));
  }
}

// REST A FINIR LE _CARTTOTAL

