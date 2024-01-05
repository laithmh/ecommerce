import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/addressdata.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Adressdetailscontroller extends GetxController {
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;

  Myservices myservices = Get.find();

  Addressdata addressdata = Addressdata(Get.find());

  List data = [];

  late Statusrequest? statusRequest;
  String? lat;
  String? long;
  intialdata() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();

    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
  }

  addaddress() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await addressdata.adddata(
        myservices.sharedPreferences.getString("id")!,
        name!.text,
        city!.text,
        street!.text,
        lat!,
        long!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(Approutes.home);
        Get.snackbar("success", "now you can order to this address");
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    intialdata();
    super.onInit();
  }
}
