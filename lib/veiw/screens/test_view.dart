import 'package:e_commerce_app/controller/test_controller.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TestControllerImp());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Title'),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body: GetBuilder<TestControllerImp>(
          builder: (controller) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                },
              ),
            );
          },
        ));
  }
}
