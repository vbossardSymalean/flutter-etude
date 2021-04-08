import 'package:flutter/material.dart';
import '../customWidgets/text-field.dart';

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() => MyCustomFormState();
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    myController.addListener(() {
      _printUserValue();
    });
    super.initState();
  }

  _printUserValue() {
    print("La valeur entrée : ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Text Field
            TextFormField(validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Veuillez entrer du texte';
              }
              return null;
            }),
            Divider(),
            CustomTextField(
              myController: myController,
            ),
            Divider(),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Donnée enregistrées')));
                  }
                },
                child: Text('Envoyer'))
          ],
        ));
  }
}
