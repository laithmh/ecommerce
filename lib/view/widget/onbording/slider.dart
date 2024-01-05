import 'package:e_commerce/controller/onbordingcontroller.dart';
import 'package:e_commerce/data/data_sours/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:lottie/lottie.dart';

class Custumslider extends GetView<Onbordingcontrollerimp> {
  const Custumslider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onpagechanged(val);
        },
        itemCount: onbordinglist.length,
        itemBuilder: (context, i) => Column(
              children: [
                Text(
                  onbordinglist[i].title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 23),
                ),
                Lottie.asset(
                  onbordinglist[i].image!,
                  width: 300,
                  height: 300,
                ),
                Text(
                  onbordinglist[i].body!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ));
  }
}
