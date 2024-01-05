import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final Statusrequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == Statusrequest.loading
        ? Center(
            child: Lottie.asset(ImageAssets.authimageloading,
                width: 250, height: 250))
        : statusRequest == Statusrequest.offlinefailure
            ? Center(
                child: Lottie.asset(ImageAssets.authimagesignup,
                    width: 250, height: 250))
            : statusRequest == Statusrequest.serverfailure
                ? Center(
                    child: Lottie.asset(ImageAssets.authimagesignin,
                        width: 250, height: 250))
                : statusRequest == Statusrequest.failure
                    ? Center(
                        child: Lottie.asset(ImageAssets.onbordingimagewallet,
                            width: 250, height: 250, repeat: true))
                    : widget;
  }
}

class HandlingDatarequest extends StatelessWidget {
  final Statusrequest statusRequest;
  final Widget widget;
  const HandlingDatarequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == Statusrequest.loading
        ? Center(
            child: Lottie.asset(ImageAssets.authimageloading,
                width: 250, height: 250))
        : statusRequest == Statusrequest.offlinefailure
            ? Center(
                child: Lottie.asset(ImageAssets.authimagesignup,
                    width: 250, height: 250))
            : statusRequest == Statusrequest.serverfailure
                ? Center(
                    child: Lottie.asset(ImageAssets.authimagesignin,
                        width: 250, height: 250))
                : statusRequest == Statusrequest.failure
                    ? Center(
                        child: Lottie.asset(ImageAssets.onbordingimagewallet,
                            width: 250, height: 250, repeat: true))
                    : widget;
  }
}
