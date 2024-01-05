import 'package:get/get.dart';

vaildinput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not vaild username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not vaild email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not vaild username";
    }
  }
  if (val.length < min) {
    return "value can`t be less than $min";
  }
  if (val.length > max) {
    return "value can`t be larger than $max";
  }
  if (val.isEmpty) {
    return "can`t be empty";
  }
}
