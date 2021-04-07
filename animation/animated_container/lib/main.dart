import 'dart:math';

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
      home: AnimatedContainerApp(),
    );
  }
}

class AnimatedContainerApp extends StatefulWidget {
  AnimatedContainerApp({Key key}) : super(key: key);

  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MyAnimatedContainer(
                width: _width,
                height: _height,
                color: _color,
                borderRadius: _borderRadius)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline_sharp),
        onPressed: () {
          setState(() {
            final random = Random();

            _width = random.nextInt(300).toDouble();
            _height = random.nextInt(300).toDouble();

            // Generate a random color.
            _color = Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            );

            // Generate a random border radius.
            _borderRadius =
                BorderRadius.circular(random.nextInt(100).toDouble());
          });
        },
      ),
    );
  }
}

class MyAnimatedContainer extends StatefulWidget {
  final double width;
  final double height;
  final Color color;
  final BorderRadiusGeometry borderRadius;

  MyAnimatedContainer(
      {Key key,
      @required this.width,
      @required this.height,
      @required this.color,
      @required this.borderRadius})
      : super(key: key);

  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: widget.borderRadius,
      ),
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }
}
