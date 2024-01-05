import 'dart:io';

import 'package:e_commerce/controller/navigatorcontroller.dart';
import 'package:e_commerce/core/constans/routesname.dart';

import 'package:e_commerce/view/widget/home/customappbarbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Navigator extends StatelessWidget {
  const Navigator({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Navigatorcontrollerimp());
    return GetBuilder<Navigatorcontrollerimp>(
      builder: (controller) => Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 211, 255, 160),
            onPressed: () {
              Get.toNamed(Approutes.mycart);
            },
            child: const Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: const Custombuttonapppar(),
          body: WillPopScope(
              child: controller.listpage.elementAt(controller.currentpage),
              onWillPop: () {
                Get.defaultDialog(
                  title: "warning",
                  middleText: "do you want to exit from app ?",
                  onConfirm: () {
                    exit(0);
                  },
                  onCancel: () {},
                );
                return Future.value(false);
              })),
    );
  }
}
