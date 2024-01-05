import 'package:e_commerce/core/constans/color.dart';
import 'package:flutter/material.dart';

class Custombuttonauth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const Custombuttonauth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        onPressed: onPressed,
        color: Appcolor.green,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Text(text),
      ),
    );
  }
}
