// ignore_for_file: avoid_print, overridden_fields

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/homedata.dart';
import 'package:e_commerce/data/data_sours/remote/notificationdata.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Homecontroller extends Searchmixcontroller {
  initialdata();
  getData();
  toitems(List categorise, int selcectedcat, String categoriesid);
}

class Homecontrollerimp extends Homecontroller {
  Myservices myservices = Get.find();
  String? username;
  String titelhome = "";
  String bodyhome = "";

  String? id;
  @override
  Homedata homedata = Homedata(Get.find());

  // List data = [];
  List categorise = [];
  List items = [];
  List settingdata = [];

  @override
  late Statusrequest statusRequest;
  @override
  initialdata() {
    username = myservices.sharedPreferences.getString("username");
    id = myservices.sharedPreferences.getString("id");
    search = TextEditingController();
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic("users");
    initialdata();
    getData();

    super.onInit();
  }

  @override
  getData() async {
    statusRequest = Statusrequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        categorise.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingdata.addAll(response['setting']['data']);
        titelhome = settingdata[0]['setting_titelhome'];
        bodyhome = settingdata[0]['setting_bodyhome'];

      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  toitems(List categorise, int selcectedcat, String categoriesid) {
    Get.toNamed(Approutes.itempage, arguments: {
      "categories": categorise,
      "selcectedcat": selcectedcat,
      "id": categoriesid,
    });
  }
}

class Searchmixcontroller extends GetxController {
  late Statusrequest statusRequest;

  List<Categorisemodel> listhomedata = [];
  Homedata homedata = Homedata(Get.find());
  TextEditingController? search;
  bool issearch = false;

  searchitems() async {
    statusRequest = Statusrequest.loading;
    var response = await homedata.searchdata(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        listhomedata.clear();
        List responsdata = response['data'];
        listhomedata
            .addAll(responsdata.map((e) => Categorisemodel.fromJson(e)));
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  checksearch(val) {
    if (val == "") {
      statusRequest = Statusrequest.none;
      issearch = false;
    }
    update();
  }

  onsearch() {
    issearch = true;
    searchitems();
    update();
  }

  gotoprodactdetails(itemsmodel) {
    Get.toNamed(Approutes.prodactdetails,
        arguments: {"itemsmodel": itemsmodel});
  }
}

class NOtificationcontroller extends GetxController {
  Myservices myservices = Get.find();

  Notificationdata notificationdata = Notificationdata(Get.find());
  List data = [];

  late Statusrequest statusRequest;
  getData() async {
    statusRequest = Statusrequest.loading;
    var response = await notificationdata
        .getData(myservices.sharedPreferences.getString("id")!);
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

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
