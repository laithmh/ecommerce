import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Ordersdata {
  Crud crud;
  Ordersdata(this.crud);
  pendinggetData(String userid) async {
    var response =
        await crud.postData(APPink.pendingorders, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }

  ordersdetailsdata(String id) async {
    var response = await crud.postData(APPink.ordersdetails, {"id": id});

    return response.fold((l) => l, (r) => r);
  }

  deletedata(String orderid) async {
    var response = await crud.postData(APPink.orderdelete, {"id": orderid});

    return response.fold((l) => l, (r) => r);
  }

  archivedata(String userid) async {
    var response =
        await crud.postData(APPink.ordersarchive, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }

  rating(String ordersid, String comment, double rating) async {
    var response = await crud.postData(APPink.rating,
        {"id": ordersid, "rating": rating.toString(), "comment": comment});

    return response.fold((l) => l, (r) => r);
  }
}
