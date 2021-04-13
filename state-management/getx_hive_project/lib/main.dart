import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive_project/controller.dart';
import 'package:getx_hive_project/routes/routes.dart';

const String dataBoxName = "data";
// USE this https://github.com/andreciornavei/flutter-getx-concept
void main() async {
  // Hive Initilization
  // WidgetsFlutterBinding.ensureInitialized();
  // final document = await getApplicationDocumentsDirectory();
  // Hive.init(document.path);
  // Hive.registerAdapter(DataModelAdapter());
  // await Hive.openBox<DataModel>(dataBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Instantiate your class using Get.put() to make it available for all "child" routes there.
    // Instead of instantiating your class within the class you are using,
    // you are instantiating it within the Get instance, which will make it
    // available throughout your App. So you can use your controller (or class Bloc) normally
    Get.put(AppController());
    // Initilisation de l'appli avec GetX => pour pouvoir utiliser
    // toutes les fonctionnalités fournis
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hive and GetX Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: routes(),
    );
  }
}
