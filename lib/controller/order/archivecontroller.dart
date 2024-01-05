import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';

import 'package:e_commerce/data/data_sours/remote/ordersdata.dart';

import 'package:e_commerce/data/model/ordersmodel.dart';
import 'package:get/get.dart';

class Orderarchivecontroller extends GetxController {
  late Statusrequest statusRequest;

  Ordersdata orders = Ordersdata(Get.find());

  List<Ordersmodel> data = [];
  // List<Categorisemodel> itemdata = [];

  Myservices myservices = Get.find();
  getorders() async {
    data.clear();
    statusRequest = Statusrequest.loading;
    update();
    var response =
        await orders.archivedata(myservices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Ordersmodel.fromJson(e)));
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  String printordertype(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "recive";
    }
  }

  String printpaymentmetode(String val) {
    if (val == "0") {
      return "cash on delivery";
    } else {
      return "card ";
    }
  }

  String printorderstatuse(String val) {
    if (val == "0") {
      return "wait to approve";
    } else if (val == "1") {
      return "approved";
    } else if (val == "2") {
      return "on the way";
    } else {
      return "archived";
    }
  }

  submintrating(double rating, String comment, String ordersid) async {
    data.clear();
    statusRequest = Statusrequest.loading;
    update();
    var response = await orders.rating(ordersid, comment, rating);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        getorders();
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  refreshorder() {
    getorders();
  }

  @override
  void onInit() {
    getorders();
    super.onInit();
  }
}
