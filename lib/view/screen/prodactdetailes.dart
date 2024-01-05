import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/prodactdetailscontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:e_commerce/view/widget/customdesctext.dart';
import 'package:e_commerce/view/widget/customprodactdesc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Prodactdetails extends GetView<Prodactdetailscontrollerimp> {
  const Prodactdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Prodactdetailscontrollerimp());
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 50,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Appcolor.appel,
            onPressed: () {
              Get.toNamed(Approutes.mycart);
            },
            child: const Text("go to cart",
                style: TextStyle(
                    color: Appcolor.grey, fontWeight: FontWeight.bold)),
          ),
        ),
        body: GetBuilder<Prodactdetailscontrollerimp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        color: Appcolor.green,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 20,
                      left: 20,
                      child: Hero(
                        tag: controller.itemsmodel.itemsId!,
                        child: CachedNetworkImage(
                          imageUrl:
                              "${APPink.itemimage}/${controller.itemsmodel.itemsImages!}",
                          height: 200,
                          width: 200,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text("${controller.itemsmodel.itemsName}",
                      style:
                          const TextStyle(color: Appcolor.green, fontSize: 20)),
                ),
                Customprodactprice(
                    onadd: () {
                      controller.add();
                    },
                    onremove: () {
                      controller.remove();
                    },
                    count: "${controller.itemscount}",
                    price: "${controller.itemsmodel.itemsPricediscount}"),
                const SizedBox(
                  height: 10,
                ),
                const Customdesctext(),
              ],
            ),
          ),
        ));
  }
}
