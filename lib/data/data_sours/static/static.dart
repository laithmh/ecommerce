import 'package:e_commerce/core/constans/imageassets.dart';
import 'package:e_commerce/data/model/onbordingmodel.dart';

List<Onbordingmodel> onbordinglist = [
  Onbordingmodel(
    title: "Shopping",
    image: ImageAssets.onbordingimagegroup,
    image2: ImageAssets.onbordingimage2,
    body:
        "We Have a 100k Product , Choose \n Your Product From  Our \n E-commerce Shop",
  ),
  Onbordingmodel(
    title: "Easy and safe payment",
    image: ImageAssets.onbordingimagewallet,
    body: "You can pay in cash \n or through payment gateways",
  ),
  Onbordingmodel(
    title: "offers all the time",
    image: ImageAssets.onbordingimagebxsoffer,
    body: "The order can be tracked at every stage \n until it reaches you",
  ),
];
