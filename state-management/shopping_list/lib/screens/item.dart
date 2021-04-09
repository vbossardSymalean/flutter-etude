import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  // Rendu de la vue *****************************************
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Nouvel article',
            style: Theme.of(context).textTheme.headline1,
          ),
          //backgroundColor: Colors.white,
        ),
        body: Container(
            //color: Colors.yellow,
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: null,
                )),
                Divider(height: 4, color: Colors.black),
                //_CartTotal()
              ],
            )));
  }
}