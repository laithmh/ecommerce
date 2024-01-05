import 'package:e_commerce/controller/order/pendingcontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/data/model/ordersmodel.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Cardorderlist extends GetView<Pendingcontroller> {
  final Ordersmodel listdata;

  const Cardorderlist({
    super.key,
    required this.listdata,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "order number : ${listdata.orderId}",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                // Text("${listdata.orderDate}"),
                Text(Jiffy.parse(listdata.orderDate!).fromNow())
              ],
            ),
            const Divider(),
            Text(
                "order type : ${controller.printordertype(listdata.orderType!)}"),
            Text("price : ${listdata.orderPrice}"),
            Text("delvery price : ${listdata.orderPricedelivrey}"),
            Text(
                "payment method :  ${controller.printpaymentmetode(listdata.orderPayment!)}"),
            Text(
                "order status :  ${controller.printorderstatuse(listdata.orderStatus!)}"),
            const Divider(),
            Row(
              children: [
                Text("total price : ${listdata.orderTotalprice}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Appcolor.green)),
                const Spacer(),
                Custombuttonauth(
                  text: "details",
                  onPressed: () {
                    Get.toNamed(Approutes.ordersdeails,
                        arguments: {"ordermodel": listdata});
                  },
                ),
                if (listdata.orderStatus == "0")
                  Custombuttonauth(
                    text: "delete",
                    onPressed: () {
                      controller.deleteorder(listdata.orderId!);
                    },
                  ),
                if (listdata.orderStatus == "3")
                  Custombuttonauth(
                    text: "tracking",
                    onPressed: () {
                      Get.toNamed(Approutes.tracking,
                          arguments: {"ordersmodel": listdata});
                    },
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
