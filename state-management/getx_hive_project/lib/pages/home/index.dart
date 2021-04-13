import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_hive_project/pages/home/controller.dart';
import 'package:getx_hive_project/shared/widgets/appBar/mainAppBar.dart';

class Home extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //var listTest = controller.testListes;

    return Scaffold(
      appBar: MainAppBar(
        title : Text("Bonjour"),
        actions: [
          IconButton(
              icon: Icon(Icons.plus_one_outlined, color: Colors.white,), 
              onPressed:() => controller.addElement()
            ),],
      ),

      body: Center(
        child: Obx(() =>
          ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: controller.testListesFromModel.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(height: 50, child: Text(controller.testListesFromModel[index].toString()));
            },
          )
          ),
      ),
      // body: Container(
      //         child: Row(
      //           children: <Widget>[
      //             // Obx(
      //             //   () => Text('${controller.title.value} ${controller.counter.value}'),
      //             // ),
      //             // Obx(() => ElevatedButton(
      //             //     onPressed: () => controller.reset(),
      //             //     child: Text('Reset Counter'))),
      //           ],
      //         )
      //     ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {controller.increment()},
      ),
    );
  }
}
