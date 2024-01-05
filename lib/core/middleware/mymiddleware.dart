import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddlware extends GetMiddleware {
  @override
  int? get priority => 1;
  Myservices myservices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: Approutes.home);
    }
    if (myservices.sharedPreferences.getString("step") == "1") {
      return const RouteSettings(name: Approutes.login);
    }

    return null;
  }
}
