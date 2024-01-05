import 'package:e_commerce/core/class/crud.dart';
import 'package:e_commerce/linkapi.dart';

class Checkemaildata {
  Crud crud;
  Checkemaildata(this.crud);
  postData(
    String email,
  ) async {
    var response = await crud.postData(APPink.chekeemail, {
      "email": email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
