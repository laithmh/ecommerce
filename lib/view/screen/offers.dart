import 'package:e_commerce/controller/favoritecontroller.dart';
import 'package:e_commerce/controller/offerscontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/widget/customofferscard.dart';
import 'package:e_commerce/view/widget/home/custumAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Offerscontroller());
    Get.put(Favoritecontroller());

    return GetBuilder<Offerscontroller>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(10),
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
              onPressednotificatoin: () {
                Get.toNamed(Approutes.notification);
              },
            ),
            const SizedBox(
              height: 10,
            ),
            !controller.issearch
                ? HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Customoffersitems(
                            itemsmodel: controller.data[index]);
                      },
                    ),
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Search(listdata: controller.listhomedata),
                  )
          ],
        ),
      ),
    );
  }
}
