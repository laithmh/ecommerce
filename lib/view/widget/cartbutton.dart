import 'package:e_commerce/controller/cartcontroller.dart';
import 'package:e_commerce/core/constans/color.dart';

import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce/view/widget/customcarttextform.dart';
import 'package:e_commerce/view/widget/language/custumbuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCartbutton extends StatelessWidget {
  final String count;
  final String discount;
  final String totalprice;
  final String shipping;
  final Function()? onPressed;

  final TextEditingController couponcontroller;
  final Function()? ontapcoupon;
  final Function()? ontaporder;

  const CustomCartbutton(
      {super.key,
      required this.count,
      required this.couponcontroller,
      this.ontapcoupon,
      this.ontaporder,
      required this.discount,
      required this.totalprice,
      required this.shipping,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GetBuilder<Cartcontroller>(
              builder: (controller) => controller.couponname == null
                  ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Custumcarttextform(
                                    hinttext: "coupon",
                                    iconData: Icons.local_offer_outlined,
                                    labeltext: "coupon code",
                                    mycontroller: couponcontroller,
                                  )),
                                  Custombuttonauth(
                                    text: "apply",
                                    onPressed: ontapcoupon,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(
                      child: Text("code name : ${controller.couponname}"),
                    )),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Appcolor.appel, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text("price :",
                          style:
                              TextStyle(fontSize: 20, color: Appcolor.black)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        count,
                        style: const TextStyle(
                            fontSize: 20, color: Appcolor.green),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text("shipping :",
                          style:
                              TextStyle(fontSize: 20, color: Appcolor.black)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        shipping,
                        style: const TextStyle(
                            fontSize: 20, color: Appcolor.green),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text("discount :",
                          style:
                              TextStyle(fontSize: 20, color: Appcolor.black)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        discount,
                        style: const TextStyle(
                            fontSize: 20, color: Appcolor.green),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: const Text("total price:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Appcolor.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        totalprice,
                        style: const TextStyle(
                            fontSize: 20, color: Appcolor.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Custombuttomlang(
            textbuttom: 'place order',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
