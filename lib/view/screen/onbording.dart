import 'package:e_commerce/controller/onbordingcontroller.dart';
import 'package:e_commerce/core/constans/routesname.dart';

import 'package:e_commerce/view/widget/onbording/custumbutton.dart';
import 'package:e_commerce/view/widget/onbording/dotcontroller.dart';
import 'package:e_commerce/view/widget/onbording/slider.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onbording extends StatelessWidget {
  const Onbording({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Onbordingcontrollerimp());
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(Approutes.language);
                  },
                  icon: const Icon(Icons.language))
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              const Expanded(
                flex: 2,
                child: Custumslider(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                              width: 400,
                              height: 215,
                              child: Image.asset(
                                "assets/Group 8.png",
                                fit: BoxFit.fill,
                              )),
                          const Column(
                            children: [
                              Dotcontroller(),
                              Custumbuttononburding(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
