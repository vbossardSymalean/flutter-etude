import 'package:hive/hive.dart';

part 'testModel.g.dart';

@HiveType(typeId: 0)
class TestModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<String> listTest = ["Bonsoir", "Hi", "Super"];

  TestModel({this.id, this.name});

  getListTest() {
    return this.listTest;
  }
}
