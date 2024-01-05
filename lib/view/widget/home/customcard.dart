import 'package:e_commerce/core/constans/color.dart';
import 'package:flutter/material.dart';

class Customcard extends StatelessWidget {
  final String cardtitel;
  final String subcardtitel;
  const Customcard(
      {super.key, required this.cardtitel, required this.subcardtitel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Appcolor.green,
            ),
            child: ListTile(
              title: Text(cardtitel,
                  style: const TextStyle(color: Colors.white, fontSize: 20)),
              subtitle: Text(subcardtitel,
                  style: const TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ),
          Positioned(
              top: -20,
              right: -20,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(220, 72, 107, 73),
                    borderRadius: BorderRadius.circular(160)),
              ))
        ],
      ),
    );
  }
}
