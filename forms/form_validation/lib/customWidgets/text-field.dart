import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  
  CustomTextField({
    Key? key,
    required TextEditingController this.myController,
  });
  TextEditingController myController;


  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Votre recherche'),
          // onChanged: (text) {
          //   print('Le text entrée : $text');
          // },
          controller: widget.myController,
        ));
  }
}
