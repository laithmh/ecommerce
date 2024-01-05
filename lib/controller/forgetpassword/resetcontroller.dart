// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/data/data_sours/remote/forgetpassword/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Resetpasswordcontroller extends GetxController {
  resetpassword();
  tosuccesseresetpassword();
}

class Resetpasswordcontrollerimp extends Resetpasswordcontroller {
  Resetpassworddata resetpassworddata = Resetpassworddata(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;
  String? email;
  Statusrequest? statusRequest;

  @override
  resetpassword() async {
    if (password.text != repassword.text) {
      return Get.defaultDialog(
          title: "warning", middleText: "password not matching");
    }

    statusRequest = Statusrequest.loading;
    update();
    var response = await resetpassworddata.postData(email!, password.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(
          Approutes.successresetpassword,
        );
      } else {
        Get.defaultDialog(title: "warning", middleText: "try agen");
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  tosuccesseresetpassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
      Get.toNamed(Approutes.successresetpassword);
    } else {
      print("not valid");
    }
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
