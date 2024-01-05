import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Offersdata {
  Crud crud;
  Offersdata(this.crud);
  getData() async {
    var response = await crud.postData(APPink.offers, {});

    return response.fold((l) => l, (r) => r);
  }
}
