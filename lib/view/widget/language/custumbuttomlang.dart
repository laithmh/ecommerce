import 'package:e_commerce/core/constans/color.dart';

import 'package:e_commerce/core/localizaition/changelocal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Custombuttomlang extends GetView<Localcontroller> {
  final String textbuttom;
  final void Function()? onPressed;
  const Custombuttomlang({
    super.key,
    required this.textbuttom,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            Appcolor.green,
          ),
        ),
        child: Text(
          textbuttom,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
