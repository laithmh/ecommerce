
import 'package:e_commerce/controller/trackingcontroller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Tracking extends StatelessWidget {
  const Tracking({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Trackingcontroller());
    return Scaffold(
      appBar: AppBar(
        title: const Text('order tracking'),
      ),
      body: GetBuilder<Trackingcontroller>(
        builder: (controller) => Column(children: [
          Expanded(
            child: SizedBox(
              height: 600,
              width: double.infinity,
              child: GoogleMap(
                mapType: MapType.normal,
                // polylines: polylineset,
                markers: controller.markers.toSet(),
                initialCameraPosition: controller.kGooglePlex!,
                onMapCreated: (GoogleMapController mapcontroller) {
                  controller.gmc = mapcontroller;
                },
              ),
            ),
          ),
         
        ]),
      ),
    );
  }
}
