import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Favoritedata {
  Crud crud;
  Favoritedata(this.crud);
  addfavorite(String userid, String itemsid) async {
    var response = await crud.postData(
        APPink.addfavorites, {"user_id": userid, "items_id": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  removefavorite(String userid, String itemsid) async {
    var response = await crud.postData(
        APPink.removefavorites, {"user_id": userid, "items_id": itemsid});

    return response.fold((l) => l, (r) => r);
  }

  viewfavorite(
    String id,
  ) async {
    var response = await crud.postData(APPink.viewfavorites, {"id": id});

    return response.fold((l) => l, (r) => r);
  }

  deleteview(
    String id,
  ) async {
    var response = await crud.postData(APPink.deletefromfavorite, {"id": id});

    return response.fold((l) => l, (r) => r);
  }
}
