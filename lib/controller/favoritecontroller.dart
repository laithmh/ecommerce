// ignore_for_file: avoid_print

import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/favoritedata.dart';
import 'package:e_commerce/data/model/myfavoritemodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favoritecontroller extends Searchmixcontroller {
  Favoritedata favoritedata = Favoritedata(Get.find());

  List data = [];
  List<Myfavoritemodel> mydata = [];

  Myservices myservices = Get.find();

  Map isfavorite = {};

  setfavorite(id, val) {
    isfavorite[id] = val;
    update();
  }

  addfavorite(String itemsid) async {
    data.clear();
    statusRequest = Statusrequest.loading;
    var response = await favoritedata.addfavorite(
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
  }

  removefavorite(String itemid) async {
    data.clear();
    statusRequest = Statusrequest.loading;
    var response = await favoritedata.removefavorite(
        myservices.sharedPreferences.getString("id")!, itemid);
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
  }

  viewfavorite() async {
    data.clear();
    statusRequest = Statusrequest.loading;
    var response = await favoritedata
        .viewfavorite(myservices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List responsedata = response['data'];
        mydata.addAll(responsedata.map((e) => Myfavoritemodel.fromJson(e)));
        print(" mydata");
        print(mydata);
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  deletefromview(String favoritesid) {
    var response = favoritedata.deleteview(favoritesid);
    print("=============================== Controller $response ");

    mydata.removeWhere((element) => element.favoritesId == favoritesid);
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    viewfavorite();
    super.onInit();
  }
}
