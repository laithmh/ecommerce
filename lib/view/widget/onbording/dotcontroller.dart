import 'package:e_commerce/controller/onbordingcontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/data/data_sours/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Dotcontroller extends StatelessWidget {
  const Dotcontroller({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Onbordingcontrollerimp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onbordinglist.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 9),
                    duration: const Duration(milliseconds: 500),
                    width: controller.currentpage == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: Appcolor.green,
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
