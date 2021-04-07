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
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue,
        accentColor: Colors.blue[400],
        appBarTheme: AppBarTheme(backgroundColor: Colors.indigo[800], centerTitle: true, elevation: 0.0),

        fontFamily: 'Georgia',

        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        )
      ),
      home: MyHomePage(title: '-  APP  -'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APP'),
      ),
      body: Center(
        child: Container(
          color: Theme.of(context).accentColor,
          child: Text(
            'Text with a background color',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(
          colorScheme:
          Theme.of(context).colorScheme.copyWith(secondary: Colors.yellow),
        ),
        child: FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
