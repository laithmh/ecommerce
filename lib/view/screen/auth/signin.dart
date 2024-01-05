import 'package:e_commerce/controller/auth/signincontroller.dart';

import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/imageassets.dart';
import 'package:e_commerce/core/function/alertexitapp.dart';
import 'package:e_commerce/core/function/vaildinput.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/custumtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Signincontrollerimp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Sign In",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: WillPopScope(
            onWillPop: alertexitapp,
            child: GetBuilder<Signincontrollerimp>(
              builder: (controller) => Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Lottie.asset(
                          ImageAssets.authimagesignin,
                        ),
                      ),
                      const Text(
                        "welcom back",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          "Sign in with your email and password or continue with social media",
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
                        height: 25,
                      ),
                      GetBuilder<Signincontrollerimp>(
                        builder: (controller) => Custumtextform(
                          obscuretext: controller.isshowepassword,
                          onTapicon: () {
                            controller.showpassword();
                          },
                          isnumber: false,
                          valid: (val) {
                            return vaildinput(val!, 5, 30, "password");
                          },
                          hinttext: "enter your password",
                          iconData: Icons.lock_outline,
                          labeltext: "Password",
                          mycontroller: controller.password,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            controller.toforgetpassword();
                          },
                          child: const Text(
                            "forget password?",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Custombuttonauth(
                        text: "Sign in",
                        onPressed: () {
                          controller.signin();
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don`t have an account? "),
                          InkWell(
                            onTap: () {
                              controller.tosignuppage();
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(color: Appcolor.green),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
