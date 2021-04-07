import 'package:flutter/material.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  bottom: TabBar(
                    tabs: [
                      Tab(text: 'Mon Espace'),
                      Tab(text: 'Mon Entreprise'),
                    ],
                  ),
                  // title: Text('Tabs Demo'),
                ),
                body: TabBarView(
                  children: [
                    MyContent1(text : 'Test'),
                    // Icon(Icons.directions_car),
                    Icon(Icons.directions_transit),
                    // Icon(Icons.directions_bike),
                  ],
                ),
                floatingActionButton: FloatingActionButton(onPressed: null, backgroundColor: Colors.white,),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            )
        )
    );
  }
}

class MyContent1 extends StatelessWidget {
  String text;
  MyContent1({this.text});

  @override
  Widget build(BuildContext build) {
    return Container(
      color: Colors.blueAccent,
      child: Center(
        // child: Text(this.text),
        child: ListView(children: [
          Container(color: Colors.amber,),
          Container(color: Colors.amber,)
        ],)
      ),
    );
  }
}
