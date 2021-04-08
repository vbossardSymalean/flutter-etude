import 'package:flutter/material.dart';

class MyLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                padding: EdgeInsets.all(80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Login'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/catalog');
                        },
                        child: Text('SE CONNECTER'),
                        style: ElevatedButton.styleFrom(primary: Colors.yellow))
                  ],
                ))));
  }
}
