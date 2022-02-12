import 'package:flutter/material.dart';
import 'package:flutter_getx_firebase/controllers/counterController.dart';
import 'package:get/get.dart';

class OtherPage extends StatelessWidget {
  final CounterController counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(()=>Column(
        children: [
          Text(" Number of Clicks ${counterController.counter.value}"),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("home page")),
        ],
      ),)
    );
  }
}
