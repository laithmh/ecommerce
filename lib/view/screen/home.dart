// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:e_commerce/controller/homecontroller.dart';

import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/imageassets.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:e_commerce/linkapi.dart';

import 'package:e_commerce/view/widget/home/Customcategorise.dart';
import 'package:e_commerce/view/widget/home/customcard.dart';

import 'package:e_commerce/view/widget/home/customitems.dart';
import 'package:e_commerce/view/widget/home/custumAppbar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Homecontrollerimp());
    return GetBuilder<Homecontrollerimp>(
      builder: (controller) => ListView(children: [
        Customappbar(
          mycontroller: controller.search!,
          onchange: (val) {
            controller.checksearch(val);
          },
          titelappbar: 'search for prodact',
          onPressedsearch: () {
            controller.onsearch();
          },
          onPressediconfavorite: () {
            Get.toNamed(Approutes.myfavorites);
          },
          onPressednotificatoin: () {
            Get.toNamed(Approutes.notification);
          },
        ),
        HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: !controller.issearch
                ? Column(
                    children: [
                      Customcard(
                          cardtitel: controller.titelhome,
                          subcardtitel: controller.bodyhome),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          " categorise",
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 87, 38),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const Customcategorise(),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          " top selling",
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 87, 38),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const Customitems(),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          " prodact for you",
                          style: TextStyle(
                              color: Color.fromARGB(255, 28, 87, 38),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      const Customitems(),
                    ],
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Search(listdata: controller.listhomedata),
                  ))
      ]),
    );
  }
}

class Search extends StatelessWidget {
  final List<Categorisemodel> listdata;
  const Search({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    Searchmixcontroller controller = Get.put(Searchmixcontroller());
    return GridView.builder(
        shrinkWrap: true,
        itemCount: listdata.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, index) {
          return InkWell(
            onTap: () {
              controller.gotoprodactdetails(listdata[index]);
            },
            child: Card(
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Hero(
                          tag: listdata[index].itemsId!,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${APPink.itemimage}/${listdata[index].itemsImages!}",
                            height: 100,
                          ),
                        ),
                      ),
                      Text(listdata[index].itemsName!),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "rating 4.4",
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (index) => const Icon(
                                        Icons.star,
                                        size: 15,
                                      ))
                            ],
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${listdata[index].itemsPrice}\$",
                              style: const TextStyle(color: Appcolor.green)),
                        ],
                      )
                    ],
                  ),
                ),
                if (listdata[index].itemsDiscount != "0")
                  Positioned(
                      top: 6,
                      child: Lottie.asset(
                        ImageAssets.onbordingimagebxsoffer,
                        width: 40,
                      ))
              ]),
            ),
          );
        });
  }
}
