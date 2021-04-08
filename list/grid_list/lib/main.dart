import 'package:flutter/material.dart';
import 'package:grid_list/lists/CustomListView.dart';
import './grids/grid.dart';
import 'package:grid_list/model/HeadingItem.dart';
import 'package:grid_list/model/MessageItem.dart';
import 'package:grid_list/model/ListItem.dart';
import 'package:grid_list/lists/HorizontalList.dart';

import 'body/FloatingAppBar.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'GridList '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  List<ListItem> items = List<ListItem>.generate(
    1000, (i) => i % 6 == 0 ? HeadingItem("Heading $i") : MessageItem("Sender $i", "Message body $i")
    );


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Corps de l'app avec un CustomScrollView
      body : FloatingAppBar(items :widget.items), floatingActionButton: FloatingActionButton(), floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // Structure Classique 
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      // body: Center(
      //   // Avec une simple GridView
      //   // child: MyCustomGrid()
      //   // Avec un list d'element custom
      //   // child: CustomListView(items :widget.items)
      //   // Liste Horizontal
      //   // child : HorizontalList()
        
      // ),
    );
  }
}
