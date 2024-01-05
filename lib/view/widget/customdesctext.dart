import 'package:e_commerce/controller/prodactdetailscontroller.dart';
import 'package:e_commerce/core/constans/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Customdesctext extends GetView<Prodactdetailscontrollerimp> {
  const Customdesctext({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Prodactdetailscontrollerimp());
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Appcolor.grey, width: 5),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("${controller.itemsmodel.itemsDesc}",
            style: const TextStyle(color: Appcolor.black, fontSize: 20)),
      ),
    );
  }
}
