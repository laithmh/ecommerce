import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Itemsdata {
  Crud crud;
  Itemsdata(this.crud);
  getData(String id, String userid) async {
    var response = await crud
        .postData(APPink.items, {"id": id.toString(), "userid": userid});

    return response.fold((l) => l, (r) => r);
  }
}
