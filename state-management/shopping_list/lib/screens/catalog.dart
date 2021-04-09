import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/cart.dart';
import 'package:shopping_list/models/catalog.dart';
import 'package:shopping_list/models/item.dart';

class MyCatalog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add_box_outlined,
          color: Theme.of(context).buttonColor,
        ),
        backgroundColor:
            Theme.of(context).floatingActionButtonTheme.backgroundColor,
        onPressed:  () => Navigator.pushNamed(context, '/item'),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

// Gestion des boutons
class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
        onPressed: isInCart
            ? null
            : () {
                // If the item is not in cart
                var cart = context.read<CartModel>();
                cart.add(item);
              },
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        })),
        child: isInCart
            ? Icon(
                Icons.check,
                semanticLabel: 'ADDED',
                color: Theme.of(context).buttonColor,
              )
            : Icon(Icons.add_shopping_cart_sharp,
                color: Theme.of(context).buttonColor));
  }
}

// Gestion de l'AppBar

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Produits', style: Theme.of(context).textTheme.headline1),
      centerTitle: true,
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}

// Gestion de la list
class _MyListItem extends StatelessWidget {
  final int index;
  _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );

    var textTheme = Theme.of(context).textTheme.headline6;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LimitedBox(
            maxHeight: 70,
            child: Container(
              decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    //color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: ItemBoxStyle(item: item),
            )));
  }
}

class ItemBoxStyle extends StatelessWidget {
  ItemBoxStyle({required this.item});

  final Item item;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme.headline6;
    return Row(children: [
      AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              color: item.color,
            ),
          )),
      SizedBox(width: 24),
      Expanded(
        child: Text(item.name, style: textTheme),
      ),
      SizedBox(width: 24),
      _AddButton(item: item)
    ]);
  }
}
