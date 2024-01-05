import 'package:cached_network_image/cached_network_image.dart';

import 'package:e_commerce/controller/favoritecontroller.dart';

import 'package:e_commerce/core/constans/color.dart';

import 'package:e_commerce/data/model/myfavoritemodel.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Customfavoritecard extends GetView<Favoritecontroller> {
  final Myfavoritemodel itemsmodel;

  const Customfavoritecard({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.toprodactdetails(itemsmodel);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Hero(
                  tag: itemsmodel.itemsId!,
                  child: CachedNetworkImage(
                    imageUrl: "${APPink.itemimage}/${itemsmodel.itemsImages!}",
                    height: 100,
                  ),
                ),
              ),
              Text(itemsmodel.itemsName!),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "rating 4.4",
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      ...List.generate(
                          5,
                          (index) => const Icon(
                                Icons.star,
                                size: 15,
                              ))
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${itemsmodel.itemsPrice}\$",
                      style: const TextStyle(color: Appcolor.green)),
                  IconButton(
                    icon: const Icon(Icons.delete_outline_outlined,
                        color: Appcolor.green),
                    onPressed: () {
                      controller.deletefromview(itemsmodel.favoritesId!);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
