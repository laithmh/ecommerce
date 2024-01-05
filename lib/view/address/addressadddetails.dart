import 'package:e_commerce/controller/addressdetailscontroller.dart';

import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/auth/custumtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addressadddetails extends StatelessWidget {
  const Addressadddetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Adressdetailscontroller());
    return Scaffold(
        appBar: AppBar(
          title: const Text(" add details address"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<Adressdetailscontroller>(
            builder: (controller) => ListView(
              children: [
                Custumtextform(
                  hinttext: "city",
                  iconData: Icons.location_city_outlined,
                  labeltext: "city",
                  mycontroller: controller.city,
                  valid: (val) {
                    return null;
                  },
                  isnumber: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Custumtextform(
                  hinttext: "street",
                  iconData: Icons.streetview_outlined,
                  labeltext: "street",
                  mycontroller: controller.street,
                  valid: (val) {
                    return null;
                  },
                  isnumber: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Custumtextform(
                  hinttext: "name",
                  iconData: Icons.person_2_outlined,
                  labeltext: "name",
                  mycontroller: controller.name,
                  valid: (val) {
                    return null;
                  },
                  isnumber: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Custombuttonauth(
                  text: "add",
                  onPressed: () {
                    controller.addaddress();
                  },
                )
              ],
            ),
          ),
        ));
  }
}
