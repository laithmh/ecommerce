import 'package:e_commerce/controller/forgetpassword/resetcontroller.dart';
import 'package:e_commerce/core/function/vaildinput.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/custumtextformauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Resetpassowrd extends StatelessWidget {
  const Resetpassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    Resetpasswordcontrollerimp controller =
        Get.put(Resetpasswordcontrollerimp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "new Password",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Please enter a new password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              Custumtextform(
                isnumber: false,
                valid: (val) {
                  return vaildinput(val!, 5, 100, "password");
                },
                mycontroller: controller.password,
                hinttext: "  enter your password",
                iconData: Icons.lock_outline,
                labeltext: "password",
              ),
              const SizedBox(
                height: 20,
              ),
              Custumtextform(
                isnumber: false,
                valid: (val) {
                  return vaildinput(val!, 5, 100, "password");
                },
                hinttext: "re enter your password",
                iconData: Icons.lock_outline,
                labeltext: "Password",
                mycontroller: controller.repassword,
              ),
              const SizedBox(
                height: 20,
              ),
              Custombuttonauth(
                text: "save",
                onPressed: () {
                  controller.resetpassword();
                },
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
