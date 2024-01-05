import 'package:e_commerce/binding.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/localizaition/changelocal.dart';
import 'package:e_commerce/core/localizaition/translation.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialservices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Localcontroller controller = Get.put(Localcontroller());

    return GetMaterialApp(
      initialBinding: Mybinding(),
      translations: Mytranslation(),
      debugShowCheckedModeBanner: false,
      title: 'ecommerce app',
      locale: controller.language,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Appcolor.green),
        useMaterial3: true,
      ),
      getPages: routes,
    );
  }
}
