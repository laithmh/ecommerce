import 'package:e_commerce/controller/itemscontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class Customcategoitem extends GetView<Itemscontrollerimp> {
  const Customcategoitem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Categoriselist(
              i: index,
              categorisemodel:
                  Categorisemodel.fromJson(controller.categories[index]),
            );
          }),
    );
  }
}

class Categoriselist extends GetView<Itemscontrollerimp> {
  final Categorisemodel categorisemodel;
  final int? i;

  const Categoriselist(
      {super.key, required this.categorisemodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changcatego(i!, categorisemodel.categoriesId!);
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          GetBuilder<Itemscontrollerimp>(
            builder: (controller) => Container(
              decoration: controller.selectedcat == i
                  ? const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Appcolor.black)))
                  : null,
              child: Text(
                "${categorisemodel.categoriesName}",
                style: const TextStyle(color: Appcolor.green, fontSize: 25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
