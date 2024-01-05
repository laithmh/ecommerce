import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/localizaition/changelocal.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<Localcontroller> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.changelang("ar");
                  Get.toNamed(Approutes.onbording);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Appcolor.green,
                  ),
                ),
                child: const Text(
                  "Arabic",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.changelang("en");
                  Get.toNamed(Approutes.onbording);
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Appcolor.green,
                  ),
                ),
                child: const Text(
                  "English",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
