import 'package:e_commerce/controller/auth/signupcontroller.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/imageassets.dart';
import 'package:e_commerce/core/function/vaildinput.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/custumtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Sign UP",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<Signupcontrollerimp>(
          
          builder: (controller) => controller.statusRequest==Statusrequest.loading?
          Center( child: Lottie.asset(
                    ImageAssets.authimageloading,
                  ),) 
          :
           Container(
            padding: const EdgeInsets.all(15),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Lottie.asset(
                    ImageAssets.authimagesignup,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Custumtextform(
                  isnumber: false,
                  valid: (val) {
                    return vaildinput(val!, 5, 100, "username");
                  },
                  hinttext: "enter your user name",
                  iconData: Icons.person_outline,
                  labeltext: "user name",
                  mycontroller: controller.username,
                ),
                const SizedBox(
                  height: 25,
                ),
                Custumtextform(
                  isnumber: true,
                  valid: (val) {
                    return vaildinput(val!, 5, 100, "phone");
                  },
                  hinttext: "enter your phone number",
                  iconData: Icons.phone_outlined,
                  labeltext: "phone number",
                  mycontroller: controller.phonenumber,
                ),
                const SizedBox(
                  height: 25,
                ),
                Custumtextform(
                  isnumber: false,
                  valid: (val) {
                    return vaildinput(val!, 5, 100, "email");
                  },
                  hinttext: "enter your email",
                  iconData: Icons.email_outlined,
                  labeltext: "Email",
                  mycontroller: controller.email,
                ),
                const SizedBox(
                  height: 25,
                ),
                Custumtextform(
                  obscuretext: controller.isshowepassword,
                  onTapicon: () {
                    controller.showpassword();
                  },
                  isnumber: false,
                  valid: (val) {
                    return vaildinput(val!, 5, 100, "password");
                  },
                  hinttext: "enter your password",
                  iconData: Icons.lock_outline,
                  labeltext: "Password",
                  mycontroller: controller.password,
                ),
                const SizedBox(
                  height: 25,
                ),
                const SizedBox(
                  height: 25,
                ),
                Custombuttonauth(
                  text: "Sign up",
                  onPressed: () {
                    controller.signup();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Do you have an account? "),
                    InkWell(
                      onTap: () {
                        controller.tosigninpage();
                      },
                      child: const Text(
                        "Sign IN",
                        style: TextStyle(color: Appcolor.green),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
