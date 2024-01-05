import 'package:e_commerce/controller/addresscontroller.dart';
import 'package:e_commerce/core/class/handeldataview.dart';
import 'package:e_commerce/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Addressadd extends StatelessWidget {
  const Addressadd({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Addresscontrolleradd());
    return Scaffold(
      appBar: AppBar(
        title: const Text(" add new address"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: const Icon(Icons.add),
      // ),
      body: GetBuilder<Addresscontrolleradd>(
          builder: (controlleradd) => HandlingDataView(
                statusRequest: controlleradd.statusrequest,
                widget: Column(children: [
                  if (controlleradd.kGooglePlex != null)
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            markers: controlleradd.markers.toSet(),
                            onTap: (latlong) {
                              controlleradd.addmarkers(latlong);
                            },
                            initialCameraPosition:
                                controlleradd.kGooglePlex!,
                            onMapCreated: (GoogleMapController controller) {
                              controlleradd.controllermap!
                                  .complete(controller);
                            },
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              child: Custombuttonauth(
                                  text: "next",
                                  onPressed: () {
                                    controlleradd.toaddressdetails();
                                  }),
                            ),
                          )
                        ],
                      ),
                    ),
                ]),
              )),
    );
  }
}
