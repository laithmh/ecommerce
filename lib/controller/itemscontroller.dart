// ignore_for_file: avoid_print, overridden_fields

import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/itemsdata.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Itemscontroller extends GetxController {
  initialdata();
  changcatego(int val, String categoid);
  getitems(String categoriesid);
  toprodactdetails(Categorisemodel itemsmodel);
}

class Itemscontrollerimp extends Searchmixcontroller {
  List categories = [];

  int? selectedcat;
  String? categoriesid;

  Itemsdata itemsdata = Itemsdata(Get.find());
  String? categoid;
  List data = [];
  Myservices myservices = Get.find();

 
  @override
  late Statusrequest statusRequest;
  getitems(categoriesid) async {
    data.clear();
    statusRequest = Statusrequest.loading;
    var response = await itemsdata.getData(
        categoriesid, myservices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  initialdata() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selcectedcat'];
    categoriesid = Get.arguments['id'];
  }

  @override
  void onInit() {
    search = TextEditingController();
    initialdata();
    getitems(categoriesid!);
    super.onInit();
  }

  changcatego(int val, String categoid) {
    selectedcat = val;
    categoriesid = categoid;
    getitems(categoriesid!);

    update();
  }

  toprodactdetails(itemsmodel) {
    Get.toNamed(Approutes.prodactdetails,
        arguments: {"itemsmodel": itemsmodel});
  }
}
