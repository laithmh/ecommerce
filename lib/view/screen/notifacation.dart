import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Notification extends StatelessWidget {
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NOtificationcontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "notification",
          textAlign: TextAlign.center,
        ),
      ),
      body: GetBuilder<NOtificationcontroller>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  ...List.generate(
                      controller.data.length,
                      (index) => Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Card(
                              child: ListTile(
                                title: Text(controller.data[index]
                                    ['notification_title']),
                                subtitle: Text(controller.data[index]
                                    ['notification_body']),
                                trailing: Text(Jiffy.parse(controller
                                        .data[index]['notification_date'])
                                    .fromNow()),
                              ),
                            ),
                          ))
                ],
              ),
            )),
      ),
    );
  }
}
