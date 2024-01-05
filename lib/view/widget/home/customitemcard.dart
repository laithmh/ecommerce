import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/controller/favoritecontroller.dart';
import 'package:e_commerce/controller/itemscontroller.dart';
import 'package:e_commerce/core/constans/color.dart';
import 'package:e_commerce/core/constans/imageassets.dart';
import 'package:e_commerce/data/model/itemsviewmodel.dart';
import 'package:e_commerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Customitemcard extends GetView<Itemscontrollerimp> {
  final Categorisemodel itemsmodel;

  const Customitemcard({
    super.key,
    required this.itemsmodel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toprodactdetails(itemsmodel);
      },
      child: Card(
        child: Stack(children: [
          Padding(
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
                      imageUrl:
                          "${APPink.itemimage}/${itemsmodel.itemsImages!}",
                      height: 100,
                    ),
                  ),
                ),
                Text(itemsmodel.itemsName!),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${itemsmodel.itemsPricediscount}\$",
                        style: const TextStyle(color: Appcolor.green)),
                    GetBuilder<Favoritecontroller>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            if (controller.isfavorite[itemsmodel.itemsId] ==
                                "1") {
                              controller.setfavorite(itemsmodel.itemsId, "0");
                              controller.removefavorite(itemsmodel.itemsId!);
                            } else {
                              controller.setfavorite(itemsmodel.itemsId, "1");
                              controller.addfavorite(itemsmodel.itemsId!);
                            }
                          },
                          icon: Icon(
                            controller.isfavorite[itemsmodel.itemsId] == "1"
                                ? Icons.favorite
                                : Icons.favorite_border_outlined,
                            color: Appcolor.green,
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
          if (itemsmodel.itemsDiscount != "0")
            Positioned(
                top: 6,
                child: Lottie.asset(
                  ImageAssets.onbordingimagebxsoffer,
                  width: 40,
                ))
        ]),
      ),
    );
  }
}
