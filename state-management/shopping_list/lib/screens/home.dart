import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/models/list.dart';
import 'package:shopping_list/models/product.dart';
import 'package:shopping_list/models/item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _MyAppBar(),
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
        onPressed: () => Navigator.pushNamed(context, '/item'),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

// Gestion de l'AppBar
class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = context.watch<ListModel>();
    return SliverAppBar(
        title: Text('Produits', style: Theme.of(context).textTheme.headline1),
        centerTitle: true,
        floating: true,
        leading: IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            // Search Management.
            onPressed: () => {
                  showSearch(
                      context: context, delegate: DataSearch(list.getList))
                }),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () => Navigator.pushNamed(context, '/cart'),
              ),
              // If list contains more than one item.
              if (list.itemCount > 0)
                Positioned(
                  left: 16,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    constraints: BoxConstraints(
                      minWidth: 15,
                      minHeight: 15,
                    ),
                    child: new Text(
                      '${list.itemCount}',
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          )
        ]);
  }
}

// Gestion de la list
class _MyListItem extends StatelessWidget {
  final int index;
  _MyListItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<ProductModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );
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

// Gestion des boutons
class _AddButton extends StatelessWidget {
  final Item item;

  const _AddButton({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<ListModel, bool>(
      (cart) => cart.items.contains(item),
    );
    var cart = context.read<ListModel>();
    return TextButton(
        onPressed: isInCart
            ? () {
                cart.remove(item);
              }
            : () {
                // If the item is not in cart
                //var cart = context.read<ListModel>();
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
                Icons.remove_shopping_cart,
                semanticLabel: 'ADDED',
                color: Theme.of(context).buttonColor,
              )
            : Icon(Icons.add_shopping_cart_sharp,
                color: Theme.of(context).buttonColor));
  }
}

// Widget de recherche :
class DataSearch extends SearchDelegate<String> {
  late List<String> listWords;

  DataSearch(this.listWords);

  @override
  List<Widget> buildActions(BuildContext context) {
    //Actions for app bar
    var list = context.watch<ListModel>();
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
      Stack(
        children: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          // If list contains more than one item.
          if (list.itemCount > 0)
            Positioned(
              left: 16,
              top: 0,
              child: Container(
                //padding: EdgeInsets.all(1),
                constraints: BoxConstraints(
                  minWidth: 15,
                  minHeight: 15,
                ),
                child: new Text(
                  '${list.itemCount}',
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            )
        ],
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, 'null');
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // show some result based on the selection
    return Center(
      child: Text(query),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something

    final suggestionList = query.isEmpty
        ? listWords
        : listWords
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    print("La valeur de la recherhe $suggestionList");
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        //title: _MyListItem(index),
        title : Text('$index'),
      ),
      itemCount: suggestionList.length,
    );
  }
}
