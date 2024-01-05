import 'package:e_commerce/controller/settingscontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    Settingcontroller controller = Get.put(Settingcontroller());
    return ListView(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              height: Get.width / 2,
              color: Appcolor.appel,
            ),
            Positioned(
                top: Get.width / 2.7,
                child: const CircleAvatar(
                  radius: 50,
                )),
          ],
        ),
        const SizedBox(
          height: 65,
        ),
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("address"),
                trailing: const Icon(Icons.location_on_outlined),
                onTap: () {
                  Get.toNamed(Approutes.addressview);
                },
              ),
              ListTile(
                title: const Text("archive"),
                trailing: const Icon(Icons.archive_outlined),
                onTap: () {
                  Get.toNamed(Approutes.ordersarchive);
                },
              ),
              ListTile(
                title: const Text("contact us"),
                trailing: const Icon(Icons.contact_mail_outlined),
                onTap: () async {
                  await launchUrl(Uri.parse("tel:+963998322482"));
                },
              ),
              ListTile(
                title: const Text("logout"),
                trailing: const Icon(Icons.logout_outlined),
                onTap: () {
                  controller.logout();
                },
              ),
              ListTile(
                title: const Text("about us"),
                trailing: const Icon(Icons.contact_support_outlined),
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
