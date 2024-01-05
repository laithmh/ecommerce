// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/data/data_sours/remote/forgetpassword/verifyforget.dart';

import 'package:get/get.dart';

abstract class Verifycodecontroller extends GetxController {
  checkcode(String verifycode);
}

class Verifycodecontrollerimmp extends Verifycodecontroller {
  Verifyforget verifyforget = Verifyforget(Get.find());
  String? email;
  Statusrequest? statusRequest;

  @override
  checkcode(verifycode) async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await verifyforget.postData(email!, verifycode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.toNamed(Approutes.resetpassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "verify code is not correct");
        statusRequest = Statusrequest.failure;
      }
    } else {
      print("===============");
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
