import 'package:e_commerce/controller/favoritecontroller.dart';
import 'package:e_commerce/controller/itemscontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/widget/home/customitemcard.dart';
import 'package:e_commerce/view/widget/home/custumAppbar.dart';
import 'package:e_commerce/view/widget/items/customcategoitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Itemscontrollerimp controller = Get.put(Itemscontrollerimp());
    Favoritecontroller favocontroller = Get.put(Favoritecontroller());

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
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
          ),
          const Customcategoitem(),
          const SizedBox(
            height: 10,
          ),
          GetBuilder<Itemscontrollerimp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.issearch
                      ? GridView.builder(
                          shrinkWrap: true,
                          itemCount: controller.data.length,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (BuildContext context, index) {
                            favocontroller.isfavorite[controller.data[index]
                                    ["items_id"]] =
                                controller.data[index]["favorites"];

                            return Customitemcard(
                              itemsmodel: Categorisemodel.fromJson(
                                  controller.data[index]),
                            );
                          })
                      : Container(
                          alignment: Alignment.center,
                          child: Search(listdata: controller.listhomedata),
                        )))
        ],
      ),
    ));
  }
}
