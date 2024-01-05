// import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/controller/favoritecontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/widget/customfavoritescard.dart';

import 'package:e_commerce/view/widget/home/custumAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

class Myfavorites extends StatelessWidget {
  const Myfavorites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Favoritecontroller());
    return Scaffold(
      body: GetBuilder<Favoritecontroller>(
        builder: (controller) => ListView(
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
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.issearch
                    ? GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.mydata.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (BuildContext context, index) {
                          return Customfavoritecard(
                              itemsmodel: controller.mydata[index]);
                        })
                    : Container(
                        alignment: Alignment.center,
                        child: Search(listdata: controller.listhomedata),
                      ))
          ],
        ),
      ),
    );
  }
}
