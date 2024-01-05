import 'package:e_commerce/controller/onbordingcontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Custumbuttononburding extends GetView<Onbordingcontrollerimp> {
  const Custumbuttononburding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(top: 100),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Appcolor.green,
      ),
      child: MaterialButton(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 4),
          onPressed: () {
            controller.next();
          },
          child: const Text("continue")),
    );
  }
}
