import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_list/common/theme.dart';
import 'package:shopping_list/models/list.dart';
import 'package:shopping_list/screens/list.dart';
import 'package:shopping_list/screens/home.dart';
import 'package:shopping_list/screens/item.dart';
import 'package:shopping_list/screens/login.dart';

import 'models/product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(create: (context) => ProductModel()),
          ChangeNotifierProxyProvider<ProductModel, ListModel>(
              create: (context) => ListModel(),
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
              '/catalog': (context) => Home(),
              '/cart': (context) => MyList(),
              '/item': (context) => Item()
            }));
  }
}
