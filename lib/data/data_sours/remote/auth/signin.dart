import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Signindata {
  Crud crud;
  Signindata(this.crud);
  postData(String password, String email) async {
    var response = await crud.postData(APPink.signin, {
      
      "password": password,
      "email": email,
      
    });

    return response.fold((l) => l, (r) => r);
  }
}
