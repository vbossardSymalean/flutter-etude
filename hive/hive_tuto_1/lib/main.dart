import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_tuto_1/models/dataModel.dart';
import 'package:hive_tuto_1/splash_screen.dart';
import 'package:path_provider/path_provider.dart';

const String dataBoxName = "data";

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>(dataBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}