import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Homedata {
  Crud crud;
  Homedata(this.crud);
  getData() async {
    var response = await crud.postData(APPink.home, {});

    return response.fold((l) => l, (r) => r);
  }

  searchdata(String search) async {
    var response = await crud.postData(APPink.search, {"search": search});

    return response.fold((l) => l, (r) => r);
  }
}
