// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/data/data_sours/remote/auth/verifycodesignup.dart';

import 'package:get/get.dart';

abstract class Verifycodesignupcontroller extends GetxController {
  checkcode();
  tosuccesssignup(String verificationCode);
  resendcode();
}

class Verifycodesignupcontrollerimmp extends Verifycodesignupcontroller {
  String? email;
  Verifycodesignupdata verifycodesignupdata = Verifycodesignupdata(Get.find());
  Statusrequest? statusRequest;
  @override
  checkcode() {}

  @override
  tosuccesssignup(verificationCode) async {
    statusRequest = Statusrequest.loading;
    update();
    var response =
        await verifycodesignupdata.postData(email!, verificationCode);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.toNamed(Approutes.successsignup);
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "verfy code not correct");
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
  
  @override
  resendcode() {
    verifycodesignupdata.resenddata(email!);
  }
}
