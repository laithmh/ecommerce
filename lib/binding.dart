import 'package:e_commerce/controller/auth/signupcontroller.dart';
import 'package:e_commerce/core/class/crud.dart';
import 'package:get/get.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Signupcontrollerimp(), fenix: true);
    Get.put(Crud());
  }
}
