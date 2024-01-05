import 'package:e_commerce/controller/order/pendingcontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';

import 'package:e_commerce/view/widget/customcardorderlist.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Pending extends StatelessWidget {
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Pendingcontroller());
    return Scaffold(
      appBar: AppBar(
        title: Container(
          alignment: Alignment.center,
          child: const Text(
            'orders',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsetsDirectional.all(10),
        child: GetBuilder<Pendingcontroller>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Cardorderlist(
                  listdata: controller.data[index],
                ),
              )),
        ),
      ),
    );
  }
}
