import 'package:e_commerce/core/constans/routesname.dart';
// import 'package:e_commerce/core/middleware/mymiddleware.dart';
import 'package:e_commerce/view/address/add.dart';
import 'package:e_commerce/view/address/addressadddetails.dart';
import 'package:e_commerce/view/address/view.dart';
// import 'package:e_commerce/testview.dart';

import 'package:e_commerce/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/verifycodesignup.dart';
import 'package:e_commerce/view/screen/auth/signin.dart';
import 'package:e_commerce/view/screen/auth/signup.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/successresetpassword.dart';
import 'package:e_commerce/view/screen/auth/successsignup.dart';
import 'package:e_commerce/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:e_commerce/view/screen/cart.dart';
import 'package:e_commerce/view/screen/checkout.dart';
import 'package:e_commerce/view/screen/itemspage.dart';
// import 'package:e_commerce/view/screen/home.dart';
import 'package:e_commerce/view/screen/language.dart';
import 'package:e_commerce/view/screen/myfavorites.dart';
import 'package:e_commerce/view/screen/navegator.dart';
import 'package:e_commerce/view/screen/notifacation.dart';
import 'package:e_commerce/view/screen/offers.dart';
import 'package:e_commerce/view/screen/onbording.dart';
import 'package:e_commerce/view/screen/orders/archive.dart';
import 'package:e_commerce/view/screen/orders/ordersdetails.dart';
import 'package:e_commerce/view/screen/orders/pending.dart';
import 'package:e_commerce/view/screen/prodactdetailes.dart';
import 'package:e_commerce/view/screen/tracking.dart';

import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  // GetPage(name: "/", page: () => const Prodactdetails()),
  GetPage(name: Approutes.login, page: () => const Login()),
  GetPage(
    name: "/",
    page: () => const Onbording(),
  ),
  GetPage(name: Approutes.language, page: () => const Language()),
  GetPage(name: Approutes.signup, page: () => const Signup()),
  GetPage(name: Approutes.forgetpassword, page: () => const Forgetpassowrd()),
  GetPage(name: Approutes.verfiycode, page: () => const Verifycode()),
  GetPage(name: Approutes.resetpassword, page: () => const Resetpassowrd()),
  GetPage(
      name: Approutes.successresetpassword,
      page: () => const Successresetpassword()),
  GetPage(name: Approutes.successsignup, page: () => const Successsignup()),
  GetPage(name: Approutes.home, page: () => const Navigator()),
  GetPage(name: Approutes.itempage, page: () => const Items()),
  GetPage(name: Approutes.prodactdetails, page: () => const Prodactdetails()),
  GetPage(name: Approutes.myfavorites, page: () => const Myfavorites()),
  GetPage(name: Approutes.mycart, page: () => const Cart()),
  GetPage(name: Approutes.addressview, page: () => const Addressview()),
  GetPage(name: Approutes.addressadd, page: () => const Addressadd()),
  GetPage(
      name: Approutes.addressadddetails, page: () => const Addressadddetails()),
  GetPage(name: Approutes.checkout, page: () => const Checkout()),
  GetPage(name: Approutes.pendingorders, page: () => const Pending()),
  GetPage(name: Approutes.notification, page: () => const Notification()),
  GetPage(name: Approutes.ordersdeails, page: () => const Ordersdetails()),
  GetPage(name: Approutes.ordersarchive, page: () => const Archive()),
  GetPage(name: Approutes.offers, page: () => const Offers()),
  GetPage(name: Approutes.tracking, page: () => const Tracking()),

  GetPage(
      name: Approutes.verifycodesignup, page: () => const Verifycodesignup()),
];
