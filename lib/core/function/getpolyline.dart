import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

Set<Polyline> polylineset = {};
List<LatLng> polylineco = [];
PolylinePoints polylinePoints = PolylinePoints();

Future<void> getpolyline(lat, long, destlat, destlong) async {
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyCd_JWcWXHSPMgUkxEoSNRmmHxbXrXznoA";
  var response = await http.post(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  var point = responsebody['routes'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    for (var pointLatLng in result) {
      polylineco.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    }
  }

  Polyline polyline = Polyline(
      polylineId: PolylineId("laith"),
      color: Colors.cyan,
      width: 5,
      points: polylineco);

  polylineset.add(polyline);
  print(destlat);
  print(destlong);
}
