import 'package:e_commerce/core/constans/color.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CUstomcheckoutcard extends StatelessWidget {
  final String titel;
  final String image;

  final bool isactive;
  final Function()? onTap;

  const CUstomcheckoutcard(
      {super.key,
      required this.titel,
      required this.isactive,
      required this.image,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isactive == true ? Appcolor.appel : null,
        child: SizedBox(
          height: 100,
          width: 100,
          child: Column(
            children: [
              SizedBox(height: 75, child: Lottie.asset(image)),
              Text(titel),
            ],
          ),
        ),
      ),
    );
  }
}
