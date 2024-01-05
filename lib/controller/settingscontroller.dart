import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class Settingcontroller extends GetxController {
  Myservices myservices = Get.find();

  logout() {
    String userid = myservices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");
    myservices.sharedPreferences.clear();
    Get.offAllNamed(Approutes.login);
  }
}
