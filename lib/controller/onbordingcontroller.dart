import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Onbordingcontroller extends GetxController {
  next();
  onpagechanged(int index);
}

class Onbordingcontrollerimp extends Onbordingcontroller {
  int currentpage = 0;
  late PageController pageController;
  Myservices myservices = Get.find();
  @override
  next() {
    currentpage++;
    if (currentpage > onbordinglist.length - 1) {
      Get.offAllNamed(Approutes.login);
      myservices.sharedPreferences.setString("step", "1");
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onpagechanged(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
