import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Resetpassworddata {
  Crud crud;
  Resetpassworddata(this.crud);
  postData(String email, String password) async {
    var response = await crud.postData(APPink.resetpassword, {
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
