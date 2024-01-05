import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/cartdata.dart';
import 'package:e_commerce/data/model/cartmodel.dart';
import 'package:e_commerce/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cartcontroller extends GetxController {
  TextEditingController? controllercoupn;
  Cartdata cartdata = Cartdata(Get.find());
  late Statusrequest statusRequest;
  Myservices myservices = Get.find();
  List<Cartmodel> data = [];
  double priceorder = 0.0;
  int totalcountitems = 0;
  Couponmodel? couponmodel;
  double discountcoupon = 0;
  String? couponname;
  String? couponid;

  add(
    String itemsid,
  ) async {
    statusRequest = Statusrequest.loading;
    update();

    var response = await cartdata.addcart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    // print("=============================== Controller $response ");
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

  delete(
    String itemsid,
  ) async {
    update();

    statusRequest = Statusrequest.loading;
    var response = await cartdata.removecart(
        myservices.sharedPreferences.getString("id")!, itemsid);
    // print("=============================== Controller $response ");
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

  viewcart() async {
    statusRequest = Statusrequest.loading;

    var response =
        await cartdata.viewcart(myservices.sharedPreferences.getString("id")!);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List responsdata = response['datacart']['data'];
          Map countpricedata = response['countprice'];
          data.clear();

          data.addAll(responsdata.map((e) => Cartmodel.fromJson(e)));
          totalcountitems = int.parse(countpricedata['totalcount']);
          priceorder = double.parse(countpricedata['totalprice']);
        } else {
          statusRequest = Statusrequest.failure;
          // print("=============================== Controller ");
        }
      }
    }
    update();
  }

  checkcoupon() async {
    statusRequest = Statusrequest.loading;

    var response = await cartdata.getcoupondata(controllercoupn!.text);
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponmodel = Couponmodel.fromJson(datacoupon);
        discountcoupon = double.parse(couponmodel!.couponDiscount!);
        couponname = couponmodel!.couponName;
        couponid = couponmodel!.couponId;
      } else {
        discountcoupon = 0;
        couponname = null;
        couponid = null;
        Get.snackbar("warning", "coupon not valid");
      }
    }
    update();
  }

  gettotalprice() {
    return priceorder - priceorder * discountcoupon / 100;
  }

  resetvarcart() {
    totalcountitems = 0;
    priceorder = 0.0;
  }

  tocheckoutpage() {
    if (data.isEmpty) return Get.snackbar("alert", "the cart is empty");

    Get.toNamed(Approutes.checkout, arguments: {
      "couponid": couponid ?? "0",
      "priceorder": priceorder.toString(),
      "discountcoupon": discountcoupon.toString(),
    });
  }

  refreshpage() {
    resetvarcart();
    viewcart();
  }

  @override
  void onInit() {
    controllercoupn = TextEditingController();
    viewcart();
    super.onInit();
  }
}
