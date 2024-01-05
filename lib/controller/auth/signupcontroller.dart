// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/data/data_sours/remote/auth/signup.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Signupcontroller extends GetxController {
  signup();
  tosigninpage();
}

class Signupcontrollerimp extends Signupcontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController username;
  late TextEditingController phonenumber;
  bool isshowepassword = true;
  Signupdata signupData = Signupdata(Get.find());
  List data = [];

  Statusrequest? statusRequest;

  showpassword() {
    isshowepassword = isshowepassword == true ? false : true;
    update();
  }

  @override
  signup() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await signupData.postData(
        username.text, password.text, email.text, phonenumber.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.offNamed(Approutes.verifycodesignup,
            arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: "warning",
            middleText: "phone number or email alredy exists");
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  tosigninpage() {
    Get.offNamed(Approutes.login);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    username = TextEditingController();
    phonenumber = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phonenumber.dispose();

    super.dispose();
  }
}
