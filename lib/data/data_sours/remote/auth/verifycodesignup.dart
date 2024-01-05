import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Verifycodesignupdata {
  Crud crud;
  Verifycodesignupdata(this.crud);
  postData(String email, String verifycode) async {
    var response = await crud.postData(APPink.verifycode, {
      "verifycode": verifycode,
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }

  resenddata(String email) async {
    var response = await crud.postData(APPink.resendverifycode, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
