import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Verifyforget {
  
  Crud crud;
  Verifyforget(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(APPink.verifyf, {
      "verifycode": verifycode,
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
