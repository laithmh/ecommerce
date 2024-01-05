import 'package:e_commerce/controller/order/archivecontroller.dart';

import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/view/widget/coustomcardarchive.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Archive extends StatelessWidget {
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Orderarchivecontroller());
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
        child: GetBuilder<Orderarchivecontroller>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => Cardorderarchivelist(
                  listdata: controller.data[index],
                ),
              )),
        ),
      ),
    );
  }
}
