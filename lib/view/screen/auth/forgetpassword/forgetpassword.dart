import 'package:e_commerce/controller/forgetpassword/forgetpasswordcontroller.dart';
import 'package:e_commerce/core/function/vaildinput.dart';

import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/custumtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Forgetpassowrd extends StatelessWidget {
  const Forgetpassowrd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Forgetpasswordconterollerimp());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            centerTitle: true,
            title: const Text(
              "Forget Password",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: GetBuilder<Forgetpasswordconterollerimp>(
            builder: (controller) => Container(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Text(
                    "Check email",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      " please Enter your email address to recive a verification code",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Custumtextform(
                    isnumber: false,
                    valid: (val) {
                      return vaildinput(val!, 5, 100, "email");
                    },
                    mycontroller: controller.email,
                    hinttext: "enter your email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Custombuttonauth(
                    text: "Chick",
                    onPressed: () {
                      controller.checkemail();
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
