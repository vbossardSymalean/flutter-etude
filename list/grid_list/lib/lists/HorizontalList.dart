import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
                width: 160.0,
                color: Colors.red,
          ),
          Container(
                width: 160.0,
                color: Colors.blue,
          ),
          Container(
                width: 160.0,
                color: Colors.orange,
          ),
          Container(
                width: 160.0,
                color: Colors.green,
          ),
        ]
      )
    );
  }
}