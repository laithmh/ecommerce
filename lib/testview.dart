import 'package:e_commerce/controller/testcontroller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(title: const Text("Title")),
      body: GetBuilder<TestController>(builder: (controller) {
        if (controller.statusRequest == Statusrequest.loading) {
          return const Center(child: Text("loding"));
        } else if (controller.statusRequest == Statusrequest.offlinefailure) {
          return const Center(child: Text("Offline Failure"));
        } else if (controller.statusRequest == Statusrequest.serverfailure) {
          return const Center(child: Text("Server Failure"));
        } else if (controller.statusRequest == Statusrequest.failure) {
          return const Center(child: Text("no data"));
        } else {
          return ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Text("${controller.data}");
              });
        }
      }),
    );
  }
}
