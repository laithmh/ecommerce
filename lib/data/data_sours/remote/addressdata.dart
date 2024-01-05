import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Addressdata {
  Crud crud;
  Addressdata(this.crud);
  adddata(String userid, String addressname, String city, String street,
      String lat, String long) async {
    var response = await crud.postData(APPink.addressadd, {
      "user_id": userid,
      "addessname": addressname,
      "city": city,
      "street": street,
      "lat": lat,
      "long": long,
    });

    return response.fold((l) => l, (r) => r);
  }

  getdata(String userid) async {
    var response = await crud.postData(APPink.addressview, {
      "user_id": userid,
    });

    return response.fold((l) => l, (r) => r);
  }

  deletdata(String addressid) async {
    var response = await crud.postData(APPink.addressdelete, {
      "addressid": addressid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
