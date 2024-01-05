import 'dart:async';

import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/addressdata.dart';
import 'package:e_commerce/data/model/addressmodel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Addresscontrolleradd extends GetxController {
  Myservices myservices = Get.find();

  Addressdata addressdata = Addressdata(Get.find());
  late Statusrequest? statusRequest;

  List<Addressmodel> data = [];
  double? lat;
  double? long;

  List<Marker> markers = [];
  Statusrequest statusrequest = Statusrequest.loading;
  Position? postion;
  Completer<GoogleMapController>? controllermap;
  CameraPosition? kGooglePlex;

  getcurrentlocation() async {
    postion = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(postion!.altitude, postion!.longitude),
      zoom: 12.4746,
    );
    addmarkers(LatLng(postion!.altitude, postion!.longitude));
    statusrequest = Statusrequest.none;
    update();
  }

  addmarkers(LatLng latLng) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
   

    update();
  }

  viewadderss() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await addressdata.getdata(
      myservices.sharedPreferences.getString("id")!,
    );
    // print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsdata = response['data'];
        data.addAll(responsdata.map((e) => Addressmodel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = Statusrequest.failure;
        }
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  deleteaddress(String addressid) {
    addressdata.deletdata(addressid);
    data.removeWhere((element) => element.addressId == addressid);
    update();
  }

  toaddressdetails() {
    Get.toNamed(Approutes.addressadddetails,
        arguments: {"lat": lat.toString(), "long": long.toString()});
  }

  @override
  void onInit() {
    viewadderss();
    getcurrentlocation();
    controllermap = Completer<GoogleMapController>();
    super.onInit();
  }
}
