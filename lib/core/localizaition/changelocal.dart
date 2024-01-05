import 'package:e_commerce/core/function/fbmconfig.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Localcontroller extends GetxController {
  Locale? language;

  Myservices myservices = Get.find();




  
  changelang(String languageCode) {
    Locale locale = Locale(languageCode);
    myservices.sharedPreferences.setString("lang", languageCode);
    Get.updateLocale(locale);
  }

  requestpermisson() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("permission", "please turn on location");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar("permission", "please allow location permission");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("permission", "please allow location permission");
    }
  }

  @override
  void onInit() {
    requestpermissionnotification();
    fbmconfig();
    requestpermisson();
    String? sherdpreflang = myservices.sharedPreferences.getString("lang");
    if (sherdpreflang == "ar") {
      language = const Locale("ar");
    } else if (sherdpreflang == "en") {
      language = const Locale("en");
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
