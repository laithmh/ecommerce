import 'package:e_commerce/controller/order/pendingcontroller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:get/get.dart';

requestpermissionnotification() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fbmconfig() {
  FirebaseMessaging.onMessage.listen((remoteMessage) {
    print("============notifcation=========");
    print(remoteMessage.notification!.title);
    print(remoteMessage.notification!.body);
    // FlutterRingtonePlayer.playNotification(asAlarm: true);
    Get.snackbar(
        remoteMessage.notification!.title!, remoteMessage.notification!.body!);
    refreshpagenotification(remoteMessage.data);
  });
}

refreshpagenotification(data) {
  print(data['pageid']);
  print(data['pagename']);
  print(Get.currentRoute);
  if (Get.currentRoute == "/home" && data['pagename'] == "order") {
    Pendingcontroller controller = Get.find();
    controller.refreshorder();
  }
}
