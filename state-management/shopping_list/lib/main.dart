import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/common/theme.dart';
import 'package:shopping_list/models/cart.dart';
import 'package:shopping_list/screens/cart.dart';
import 'package:shopping_list/screens/catalog.dart';
import 'package:shopping_list/screens/item.dart';
import 'package:shopping_list/screens/login.dart';

import 'models/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => CatalogModel()),
          ChangeNotifierProxyProvider<CatalogModel, CartModel>(
              create: (context) => CartModel(),
              update: (context, catalog, cart) {
                if (cart == null) throw ArgumentError.notNull('cart');
                cart.catalog = catalog;
                return cart;
              })
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Provider Demo',
            theme: appTheme,
            initialRoute: '/',
            routes: {
              '/': (context) => MyLogin(),
              '/catalog': (context) => MyCatalog(),
              '/cart': (context) => MyCart(),
              '/item': (context) => Item()
            }));
  }
}
