import 'package:e_commerce/controller/addresscontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/data/model/addressmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Addressview extends StatelessWidget {
  const Addressview({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Addresscontrolleradd());
    return Scaffold(
      appBar: AppBar(
        title: const Text("address"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Approutes.addressadd);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<Addresscontrolleradd>(
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusrequest,
            widget: ListView.builder(
              itemCount: controller.data.length,
              itemBuilder: (context, index) {
                return Cardaddress(
                  addressmodel: controller.data[index],
                  onPressed: () {
                    controller.deleteaddress(controller.data[index].addressId!);
                  },
                );
              },
            )),
      ),
    );
  }
}

class Cardaddress extends StatelessWidget {
  final Function()? onPressed;
  final Addressmodel addressmodel;
  const Cardaddress({super.key, required this.addressmodel, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text(addressmodel.addressName!),
          subtitle: Text(
              "${addressmodel.addressCity!}  ${addressmodel.addressStreet!}"),
          trailing: IconButton(
              onPressed: onPressed, icon: Icon(Icons.delete_outline)),
        ),
      ),
    );
  }
}
