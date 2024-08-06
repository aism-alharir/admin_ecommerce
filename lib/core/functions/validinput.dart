import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "36".tr;
  }
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "37".tr;
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "38".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "39".tr;
    }
  }

  if (val.length < min) {
    return "40".tr;
  }
  if (val.length > max) {
    return "41".tr;
  }
}
