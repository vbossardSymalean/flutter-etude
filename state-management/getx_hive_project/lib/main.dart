import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive_project/controller.dart';
import 'package:getx_hive_project/routes/routes.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

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
