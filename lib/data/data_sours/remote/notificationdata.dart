import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Notificationdata {
  Crud crud;
  Notificationdata(this.crud);
  getData(String userid) async {
    var response = await crud.postData(APPink.notification, {"userid": userid});

    return response.fold((l) => l, (r) => r);
  }
}
