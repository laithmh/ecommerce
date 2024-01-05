import 'package:e_commerce/controller/cartcontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';

import 'package:e_commerce/core/constans/color.dart';


import 'package:e_commerce/view/widget/cartbutton.dart';
import 'package:e_commerce/view/widget/customcartcard.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Cartcontroller cartcontroller = Get.put(Cartcontroller());
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          title: Padding(
            padding: const EdgeInsets.only(right: 45),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: const Text(
                "cart",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          )),
      bottomNavigationBar: GetBuilder<Cartcontroller>(
        builder: (controller) => CustomCartbutton(
          shipping: "50",
          totalprice: "${controller.gettotalprice()}",
          discount: "${controller.discountcoupon}",
          count: "${cartcontroller.priceorder}",
          couponcontroller: controller.controllercoupn!,
          ontapcoupon: () {
            controller.checkcoupon();
          },
          onPressed: () {
            controller.tocheckoutpage();
          },
        ),
      ),
      body: GetBuilder<Cartcontroller>(
          builder: (cartcontroller) => HandlingDataView(
                statusRequest: cartcontroller.statusRequest,
                widget: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Appcolor.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Text(
                              "you have ${cartcontroller.totalcountitems} items in your list",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          ...List.generate(
                              cartcontroller.data.length,
                              (index) => Customcartcard(
                                    addcart: () async {
                                      await cartcontroller.add(
                                          cartcontroller.data[index].itemsId!);
                                      cartcontroller.refreshpage();
                                    },
                                    removecart: () async {
                                      await cartcontroller.delete(
                                          cartcontroller.data[index].itemsId!);
                                      cartcontroller.refreshpage();
                                    },
                                    imgename:
                                        "${cartcontroller.data[index].itemsImages}",
                                    name:
                                        '${cartcontroller.data[index].itemsName}',
                                    count:
                                        "${cartcontroller.data[index].countitems}",
                                    peice:
                                        "${cartcontroller.data[index].itemsprice}",
                                  ))
                        ],
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}
