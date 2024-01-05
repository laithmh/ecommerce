import 'package:e_commerce/controller/homecontroller.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customitems extends GetView<Homecontrollerimp> {
  const Customitems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return Item(
              categorisemodel: Categorisemodel.fromJson(controller.items[i]),
            );
          }),
    );
  }
}

class Item extends GetView<Homecontrollerimp> {
  final Categorisemodel categorisemodel;
  const Item({super.key, required this.categorisemodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.gotoprodactdetails(categorisemodel);
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.network(
              "${APPink.itemimage}/${categorisemodel.itemsImages}",
              height: 150,
              width: 150,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            height: 150,
            width: 200,
          ),
          Positioned(
              left: 10,
              child: Text(
                "${categorisemodel.itemsName}",
                style: const TextStyle(color: Colors.white, fontSize: 14),
              ))
        ],
      ),
    );
  }
}
