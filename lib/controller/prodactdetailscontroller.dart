import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/cartdata.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

abstract class Prodactdetailscontroller extends GetxController {}

class Prodactdetailscontrollerimp extends Prodactdetailscontroller {
  late Categorisemodel itemsmodel;

  late Statusrequest statusRequest;
  int itemscount = 0;
  Cartdata cartdata = Cartdata(Get.find());
  Myservices myservices = Get.find();

  ontialdata() async {
    statusRequest = Statusrequest.loading;
    itemsmodel = Get.arguments['itemsmodel'];
    itemscount = await getitemcount(itemsmodel.itemsId!);
    statusRequest = Statusrequest.success;
    update();
  }

  @override
  void onInit() {
    ontialdata();

    super.onInit();
  }

  getitemcount(
    String itemsid,
  ) async {
    int itemscount = 0;

    statusRequest = Statusrequest.loading;
    var response = await cartdata.getitemcount(
        myservices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        itemscount = int.parse(response['data']);
        print("=============================== Controller $itemscount ");
        return itemscount;
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  additems(
    String itemsid,
  ) async {
    statusRequest = Statusrequest.loading;
    update();

    var response = await cartdata.addcart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "warning", messageText: const Text("done successfully"));
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  deleteitems(
    String itemsid,
  ) async {
    update();

    statusRequest = Statusrequest.loading;
    var response = await cartdata.removecart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "warning", messageText: const Text("done successfully"));
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  add() {
    itemscount++;
    additems(itemsmodel.itemsId!);
    update();
  }

  remove() {
    if (itemscount > 0) {
      deleteitems(itemsmodel.itemsId!);
      itemscount--;
    }
    update();
  }
}
