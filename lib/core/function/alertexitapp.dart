import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertexitapp() {
  Get.defaultDialog(middleText: "do you want to exit the app", actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: const Text("Yes")),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: const Text("No")),
  ]);
  return Future.value(true);
}
