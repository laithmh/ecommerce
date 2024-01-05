import 'package:e_commerce/controller/auth/verifycodesignup.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/imageassets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Verifycodesignup extends StatelessWidget {
  const Verifycodesignup({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Verifycodesignupcontrollerimmp());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: const Text(
            "Verification  Code",
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        body: GetBuilder<Verifycodesignupcontrollerimmp>(
          builder: (controller) => controller.statusRequest ==
                  Statusrequest.loading
              ? Center(
                  child: Lottie.asset(
                    ImageAssets.authimageloading,
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(15),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      const Text(
                        "Check Code",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Text(
                          " Please enter the digit code sent to your email address",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      OtpTextField(
                        numberOfFields: 5,
                        borderColor: const Color.fromARGB(255, 102, 102, 102),
                        showFieldAsBox: true,
                        onCodeChanged: (String code) {},
                        onSubmit: (String verificationCode) {
                          controller.tosuccesssignup(verificationCode);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          controller.resendcode();
                        },
                        child: const Center(
                            child: Text(
                          "resend code",
                          style: TextStyle(fontSize: 20),
                        )),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
