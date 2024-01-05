import 'package:e_commerce/core/constans/color.dart';
import 'package:flutter/material.dart';

class Customprodactprice extends StatelessWidget {
  final void Function()? onadd;
  final void Function()? onremove;
  final String price;
  final String count;

  const Customprodactprice(
      {super.key,
      required this.onadd,
      required this.onremove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Row(
            children: [
              IconButton(onPressed: onadd, icon: const Icon(Icons.add)),
              Container(
                alignment: Alignment.center,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Appcolor.grey,
                  ),
                ),
                child: Text(
                  count,
                  style: const TextStyle(
                      color: Appcolor.grey, fontSize: 20, height: 1.1),
                ),
              ),
              IconButton(onPressed: onremove, icon: const Icon(Icons.remove))
            ],
          ),
          const Spacer(),
          Text(
            "$price\$",
            style: const TextStyle(color: Appcolor.green, fontSize: 20),
          )
        ],
      ),
    );
  }
}
