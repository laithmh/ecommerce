import 'package:e_commerce/controller/order/orderdetailscontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Ordersdetails extends StatelessWidget {
  const Ordersdetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Orderdetailscontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('order details'),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<Orderdetailscontroller>(
            builder: (controller) => ListView(children: [
              Card(
                child: Column(
                  children: [
                    Table(
                      children: [
                        const TableRow(children: [
                          Text(
                            " prodacat name",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "QTY",
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "price",
                            textAlign: TextAlign.center,
                          ),
                        ]),
                        ...List.generate(
                            controller.data.length,
                            (index) => TableRow(children: [
                                  Text(
                                    "${controller.data[index].itemsName}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].countitems}",
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${controller.data[index].itemsPrice}",
                                    textAlign: TextAlign.center,
                                  ),
                                ])),
                      ],
                    ),
                    Text(
                      "total price : ${controller.ordersmodel!.orderTotalprice}",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (controller.ordersmodel!.orderType == "0")
                Card(
                  child: ListTile(
                    title: const Text("shipping address"),
                    subtitle: Text(
                        "${controller.ordersmodel!.addressCity} ${controller.ordersmodel!.addressStreet}"),
                  ),
                ),
              if (controller.ordersmodel!.orderType == "0")
                Card(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: controller.markers.toSet(),
                      initialCameraPosition: controller.kGooglePlex!,
                      onMapCreated: (GoogleMapController mapcontroller) {
                        controller.controllermap!.complete(mapcontroller);
                      },
                    ),
                  ),
                )
            ]),
          )),
    );
  }
}
