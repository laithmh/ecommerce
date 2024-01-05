// ignore_for_file: avoid_print

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/auth/signin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Signincontroller extends GetxController {
  signin();
  tosignuppage();
  toforgetpassword();
}

class Signincontrollerimp extends Signincontroller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  bool isshowepassword = true;
  Signindata signinData = Signindata(Get.find());
  Statusrequest? statusRequest = Statusrequest.none;
  Myservices myservices = Get.find();

  showpassword() {
    isshowepassword = isshowepassword == true ? false : true;
    update();
  }

  @override
  signin() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await signinData.postData(password.text, email.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (response['data']['user_approve'] == "1") {
          myservices.sharedPreferences
              .setString("id", response['data']['user_id']);
          String userid = myservices.sharedPreferences.getString("id")!;
          myservices.sharedPreferences
              .setString("username", response['data']['user_name']);

          myservices.sharedPreferences
              .setString("email", response['data']['user_email']);
          myservices.sharedPreferences
              .setString("phone", response['data']['user_phone']);
          myservices.sharedPreferences.setString("step", "2");
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users$userid");

          Get.offNamed(
            Approutes.home,
          );
        } else {
          Get.toNamed(Approutes.verifycodesignup,
              arguments: {"email": email.text});
        }
      } else {
        Get.defaultDialog(
            title: "warning", middleText: "password or email not correct");
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  @override
  tosignuppage() {
    Get.offNamed(Approutes.signup);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print(token);
    });
    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();

    super.dispose();
  }

  @override
  toforgetpassword() {
    Get.toNamed(Approutes.forgetpassword);
  }
}
