import 'package:e_commerce/controller/order/checkoutcontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/imageassets.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/view/widget/checkout/customaddresscard.dart';

import 'package:e_commerce/view/widget/checkout/customcheckoutcaed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Checkoutcontroller controller = Get.put(Checkoutcontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text("checkout"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Appcolor.green,
          textColor: Colors.white,
          onPressed: () {
            controller.checkout();
          },
          child: const Text("check out"),
        ),
      ),
      body: GetBuilder<Checkoutcontroller>(
          builder: (controller) => Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "choose payment method:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CUstomcheckoutcard(
                            onTap: () {
                              controller.choicepayment("1");
                            },
                            image: ImageAssets.onbordingimagewallet,
                            isactive:
                                controller.paymentmethod == "1" ? true : false,
                            titel: "card",
                          ),
                          CUstomcheckoutcard(
                            onTap: () {
                              controller.choicepayment("0");
                            },
                            image: ImageAssets.onbordingimagewallet,
                            isactive:
                                controller.paymentmethod == "0" ? true : false,
                            titel: "cash",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "choose delivrey:",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          CUstomcheckoutcard(
                            onTap: () {
                              controller.choicedelivreytype("0");
                            },
                            image: ImageAssets.onbordingimagewallet,
                            isactive:
                                controller.delivreytype == "0" ? true : false,
                            titel: "delivrey",
                          ),
                          CUstomcheckoutcard(
                            onTap: () {
                              controller.choicedelivreytype("1");
                            },
                            image: ImageAssets.onbordingimagewallet,
                            isactive:
                                controller.delivreytype == "1" ? true : false,
                            titel: "drive thro",
                          ),
                        ],
                      ),
                    ),
                    if (controller.delivreytype == "0")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              "address :",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          if (controller.addresslistdata.isEmpty)
                            InkWell(
                              onTap: () {
                                Get.toNamed(Approutes.addressadd);
                              },
                              child: Container(
                                child: const Center(
                                    child: Text(
                                  "plase add shipping address \n click here",
                                  textAlign: TextAlign.center,
                                )),
                              ),
                            ),
                          ...List.generate(
                            controller.addresslistdata.length,
                            (index) => Customaddresscard(
                              onTap: () {
                                controller.choiceaddress(
                                    "${controller.addresslistdata[index].addressId}");
                              },
                              isacvtive: controller.addressid ==
                                      controller
                                          .addresslistdata[index].addressId
                                  ? true
                                  : false,
                              titel:
                                  "${controller.addresslistdata[index].addressName}",
                              subtitel:
                                  "${controller.addresslistdata[index].addressCity} ${controller.addresslistdata[index].addressStreet}",
                            ),
                          )
                        ],
                      )
                  ],
                ),
              )),
    );
  }
}
