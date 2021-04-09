import 'package:flutter/material.dart';

// App theme Definition


final appTheme = ThemeData(
    // primarySwatch: MaterialColor(0xFF2F4D7D, {600: shadeColor(color, 0.1)}),
    // primaryColor: Colors.amberAccent,
    // primaryColorDark: ,
    brightness: Brightness.dark,
    textTheme: TextTheme(
        headline1: TextStyle(
      //fontFamily: 'Corben',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Colors.white,
      )
    ),
    buttonColor: Colors.white,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue[600],
    )
);
