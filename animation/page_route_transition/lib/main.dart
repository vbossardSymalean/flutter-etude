import 'package:flutter/material.dart';

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
      home: Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: ElevatedButton(
          child: Text('Go !'),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        )));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page2(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var curvedAnimation = CurvedAnimation(parent: animation, curve: curve);
        return SlideTransition(
            position: tween.animate(curvedAnimation), child: child);
      });
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text('Page 2 !')));
  }
}
