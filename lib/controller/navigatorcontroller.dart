import 'package:e_commerce/view/screen/home.dart';

import 'package:e_commerce/view/screen/offers.dart';
import 'package:e_commerce/view/screen/orders/pending.dart';
import 'package:e_commerce/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Navigator extends GetxController {
  changepage(int i);
}

class Navigatorcontrollerimp extends Navigator {
  int currentpage = 0;
  List<Widget> listpage = [
    const Home(),
    const Offers(),
    const Pending(),
    const Setting()
  ];
  List buttonappbar = [
    {"title": "home", "icon": Icons.home_outlined},
    {"title": "offers", "icon": Icons.local_offer_outlined},
    {"title": "orders", "icon": Icons.track_changes_outlined},
    {"title": "settings", "icon": Icons.settings}
  ];

  @override
  changepage(int i) {
    currentpage = i;
    update();
  }
}
