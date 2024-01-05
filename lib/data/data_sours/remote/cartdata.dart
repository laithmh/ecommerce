import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Cartdata {
  Crud crud;
  Cartdata(this.crud);
  addcart(String userid, String itemsid) async {
    var response = await crud
        .postData(APPink.addcart, {"user_id": userid, "items_id": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  removecart(String userid, String itemsid) async {
    var response = await crud
        .postData(APPink.removecart, {"user_id": userid, "items_id": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  viewcart(
    String id,
  ) async {
    var response = await crud.postData(APPink.cartview, {"userid": id});

    return response.fold((l) => l, (r) => r);
  }

  // deleteviewcart(
  //   String id,
  // ) async {
  //   var response = await crud.postData(APPink.deletefromfavorite, {"id": id});

  //   return response.fold((l) => l, (r) => r);
  // }

  getitemcount(String userid, String itemsid) async {
    var response = await crud.postData(
        APPink.getcountcart, {"user_id": userid, "items_id": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  getcoupondata(String couponname) async {
    var response = await crud.postData(APPink.couponcheck, {
      "couponname": couponname,
    });

    return response.fold((l) => l, (r) => r);
  }
}
