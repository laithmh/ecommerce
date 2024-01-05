// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/data/data_sours/remote/forgetpassword/checkemail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Forgetpasswordconteroller extends GetxController {
  checkemail();
  toverfiycode();
}

class Forgetpasswordconterollerimp extends Forgetpasswordconteroller {
  Checkemaildata checkemaildata = Checkemaildata(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  Statusrequest? statusRequest;
  @override
  checkemail() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await checkemaildata.postData(email.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(Approutes.verfiycode, arguments: {"email": email.text});
      } else {
        Get.defaultDialog(title: "warning", middleText: "email not found");
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  toverfiycode() {
    Get.toNamed(Approutes.verfiycode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  // @override
  // void dispose() {
  //   email.dispose();

  //   super.dispose();
  // }
}
