import 'package:cached_network_image/cached_network_image.dart';

import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';

class Customcartcard extends StatelessWidget {
  final String name;
  final String peice;
  final String count;
  final String imgename;
  final void Function()? addcart;
  final void Function()? removecart;

  const Customcartcard(
      {super.key,
      required this.name,
      required this.peice,
      required this.count,
      required this.imgename,
      this.addcart,
      this.removecart});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                  imageUrl: "${APPink.itemimage}/$imgename")),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name),
                subtitle: Text(peice),
              )),
          Expanded(
              child: Column(
            children: [
              IconButton(onPressed: addcart, icon: const Icon(Icons.add)),
              Text(count),
              IconButton(onPressed: removecart, icon: const Icon(Icons.remove)),
            ],
          )),
        ],
      ),
    );
  }
}
