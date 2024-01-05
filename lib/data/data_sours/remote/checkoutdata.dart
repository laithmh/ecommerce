import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Checkoutdata {
  Crud crud;
  Checkoutdata(this.crud);
  getData(Map data) async {
    var response = await crud.postData(APPink.checkout,data);

    return response.fold((l) => l, (r) => r);
  }
}
