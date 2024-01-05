import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/getpolyline.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/model/ordersmodel.dart';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Trackingcontroller extends GetxController {
  // Acceptedorderscontroller acceptedorderscontroller = Get.find();

  StreamSubscription<Position>? positionstream;
  Ordersmodel? ordersmodel;

  Myservices myservices = Get.find();
  late Statusrequest statusRequest;
  bool isloading = false;

  Position? postion;
  Timer? timer;

  List<Marker> markers = [];

  GoogleMapController? gmc;
  CameraPosition? kGooglePlex;

  double? destlat;
  double? destlon;

  double? currentlat;
  double? currentlong;

  getcurrentlocation() {
    kGooglePlex = CameraPosition(
        target: LatLng(double.parse(ordersmodel!.addressLat!),
            double.parse(ordersmodel!.addressLong!)),
        zoom: 12.151926040649414);
    markers.add(Marker(
        markerId: const MarkerId("current"),
        position: LatLng(double.parse(ordersmodel!.addressLat!),
            double.parse(ordersmodel!.addressLong!))));
    update();
  }

  deliverylocation() {
    FirebaseFirestore.instance
        .collection("delivery")
        .doc(ordersmodel!.orderId!)
        .snapshots()
        .listen((event) {
      if (event.exists) {
        destlat = event.get("lat");
        destlon = event.get("long");
        updatemarkerdilvery(destlat!, destlon!);
      }
    });
  }

  updatemarkerdilvery(double newlan, double newlong) {
    markers.removeWhere((element) => element.markerId.value == "dest");
    markers.add(Marker(
        markerId: const MarkerId("dest"), position: LatLng(newlan, newlong)));
    update();
  }

  initpolyline() async {
    destlat = double.parse(
      ordersmodel!.addressLat!,
    );
    destlon = double.parse(
      ordersmodel!.addressLong!,
    );
    await Future.delayed(Duration(seconds: 1));
    await getpolyline(currentlat, currentlong, destlat, destlon);
    print("===========$destlat");
    print("==========$destlon");
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordersmodel'];
    deliverylocation();
    // initpolyline();
    getcurrentlocation();
    super.onInit();
  }

  @override
  void onClose() {
    gmc!.dispose();

    super.onClose();
  }
}
