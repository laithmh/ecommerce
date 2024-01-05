import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Testdata {
  Crud crud;
  Testdata(this.crud);
  getData() async {
    var response = await crud.postData(APPink.test, {});

    return response.fold((l) => l, (r) => r);
  }
}
