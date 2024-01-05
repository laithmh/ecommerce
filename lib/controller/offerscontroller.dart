// ignore_for_file: avoid_print

import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/data/data_sours/remote/offersdata.dart';

import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offerscontroller extends Searchmixcontroller {
  Offersdata offersdata = Offersdata(Get.find());

  List<Categorisemodel> data = [];

  late Statusrequest statusRequest;

  getData() async {
    statusRequest = Statusrequest.loading;
    var response = await offersdata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata2 = response['data'];
        data.addAll(listdata2.map((e) => Categorisemodel.fromJson(e)));
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  toprodactdetails(itemsmodel) {
    Get.toNamed(Approutes.prodactdetails,
        arguments: {"itemsmodel": itemsmodel});
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}
