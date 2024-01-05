import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class Customcategorise extends GetView<Homecontrollerimp> {
  const Customcategorise({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 150,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: controller.categorise.length,
          itemBuilder: (context, index) {
            return Categoriselist(
              i: index,
              categorisemodel:
                  Categorisemodel.fromJson(controller.categorise[index]),
            );
          }),
    );
  }
}

class Categoriselist extends GetView<Homecontrollerimp> {
  final Categorisemodel categorisemodel;
  final int? i;

  const Categoriselist(
      {super.key, required this.categorisemodel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toitems(
            controller.categorise, i!, categorisemodel.categoriesId!);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 83, 180, 85),
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 100,
            child: SvgPicture.network(
              "${APPink.categoriesimage}/${categorisemodel.categoriesImage}",
              // ignore: deprecated_member_use
              color: const Color.fromARGB(255, 28, 87, 38),
            ),
          ),
          Text(
            "${categorisemodel.categoriesName}",
            style: const TextStyle(
                color: Color.fromARGB(255, 28, 87, 38), fontSize: 20),
          )
        ],
      ),
    );
  }
}
