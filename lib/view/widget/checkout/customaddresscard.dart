import 'package:e_commerce/core/constans/color.dart';
import 'package:flutter/material.dart';

class Customaddresscard extends StatelessWidget {
  final String? titel;
  final String? subtitel;
  final bool isacvtive;
  final Function()? onTap;

  const Customaddresscard({
    super.key,
    required this.titel,
    required this.subtitel,
    required this.isacvtive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          color: isacvtive ? Appcolor.appel : null,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: ListTile(
              title: Text("$titel"),
              subtitle: Text(
                "$subtitel",
              )),
        ),
      ),
    );
  }
}
