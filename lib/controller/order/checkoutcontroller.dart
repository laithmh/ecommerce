import 'package:e_commerce/core/class/statusrequest.dart';
import 'package:e_commerce/core/constans/routesname.dart';
import 'package:e_commerce/core/function/handeldata.dart';
import 'package:e_commerce/core/services/services.dart';
import 'package:e_commerce/data/data_sours/remote/addressdata.dart';
import 'package:e_commerce/data/data_sours/remote/checkoutdata.dart';
import 'package:e_commerce/data/model/addressmodel.dart';
import 'package:get/get.dart';

class Checkoutcontroller extends GetxController {
  Myservices myservices = Get.find();

  late Statusrequest? statusRequest;

  List<Addressmodel> addresslistdata = [];

  Addressdata addressdata = Get.put(Addressdata(Get.find()));
  Checkoutdata checkoutdata = Get.put(Checkoutdata(Get.find()));

  String? paymentmethod;
  String? delivreytype;
  String addressid = "0";
  late String couponyid;
  late String priceorder;
  late String discountcoupon;

  choicepayment(String val) {
    paymentmethod = val;
    update();
  }

  choicedelivreytype(String val) {
    delivreytype = val;
    update();
  }

  choiceaddress(String val) {
    addressid = val;
    update();
  }

  viewadderss() async {
    statusRequest = Statusrequest.loading;
    update();
    var response = await addressdata.getdata(
      myservices.sharedPreferences.getString("id")!,
    );
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responsdata = response['data'];
        addresslistdata
            .addAll(responsdata.map((e) => Addressmodel.fromJson(e)));
        addressid = addresslistdata[0].addressId.toString();
        if (addresslistdata.isEmpty) {
          statusRequest = Statusrequest.failure;
        }
      } else {
        statusRequest = Statusrequest.failure;
      }
    }
    update();
  }

  checkout() async {
    if (paymentmethod == null) {
      return Get.snackbar("", "please  select payment method");
    }
    if (delivreytype == null) {
      return Get.snackbar("", "please  select order type");
    }
    if (addressid.isEmpty) {
      return Get.snackbar("", "please  chosse address");
    }

    statusRequest = Statusrequest.loading;
    update();
    Map datacheckout = {
      "userid": myservices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "ordertype": delivreytype.toString(),
      "pricedelivrey": "10",
      "couponid": couponyid,
      "coupondiscout": discountcoupon.toString(),
      "orderprice": priceorder,
      "paymentmethod": paymentmethod.toString(),
    };
    update();
    var response = await checkoutdata.getData(datacheckout);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (Statusrequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(Approutes.home);
        Get.snackbar("success", "the order was successfuly done");
      } else {
        statusRequest = Statusrequest.none;
        Get.snackbar("something went wrong", "plase try agein");
      }
    }
    update();
  }

  @override
  void onInit() {
    couponyid = Get.arguments['couponid'];
    priceorder = Get.arguments['priceorder'];
    discountcoupon = Get.arguments['discountcoupon'].toString();

    viewadderss();
    super.onInit();
  }
}
