import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:getx_hive_project/pages/home/testModel.dart';

class HomeController extends GetxController {
  HomeController() {
    this.testModel = TestModel();
  }

  TestModel testModel;

  RxInt counter = 0.obs;

  RxString title = "Test du titre".obs;

  RxList<String> testListes = [
    "Salut",
    "Hallo",
    "Bonjour",
    "Hello",
  ].obs;

  RxList<TestModel> testListesFromModel = RxList<TestModel>();

  void increment() {
    print("Bojour");
    counter.value++;
  }

  void reset() {
    if (counter.value != 0) {
      counter.value = 0;
    }
  }

  void addElement() {
    testListes.add("New Value");
  }
}
