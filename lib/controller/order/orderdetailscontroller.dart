import 'dart:async';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/data/data_sours/remote/ordersdata.dart';
import 'package:e_commerce/data/model/cartmodel.dart';
import 'package:e_commerce/data/model/ordersmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Orderdetailscontroller extends GetxController {
  Ordersmodel? ordersmodel;
  double? lat;
  double? long;
  Position? postion;

  List<Marker> markers = [];
  Completer<GoogleMapController>? controllermap;
  CameraPosition? kGooglePlex;

  Ordersdata ordersdata = Ordersdata(Get.find());

  List<Cartmodel> data = [];

  late Statusrequest statusRequest;

  getData() async {
    statusRequest = Statusrequest.loading;
    var response = await ordersdata.ordersdetailsdata(ordersmodel!.orderId!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listdata = response['data'];
        data.addAll(listdata.map((e) => Cartmodel.fromJson(e)));
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  initialdata() {
    if (ordersmodel!.orderType == "0") {
      kGooglePlex = CameraPosition(
          target: LatLng(double.parse(ordersmodel!.addressLat!),
              double.parse(ordersmodel!.addressLong!)),
          zoom: 12.151926040649414);
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(double.parse(ordersmodel!.addressLat!),
              double.parse(ordersmodel!.addressLong!))));
    }
  }

  @override
  void onInit() {
    ordersmodel = Get.arguments['ordermodel'];
    getData();
    initialdata();
    super.onInit();
  }
}
