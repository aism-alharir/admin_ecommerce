import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/constant/routes.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPasswordController extends GetxController {
  resetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController rePassword;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  bool isShoowpass = true;
  shoowPassword() {
    isShoowpass = isShoowpass == true ? false : true;
    update();
  }

  @override
  goToSuccessResetPassword() async {
    if (password.text != rePassword.text) {
      return Get.defaultDialog(title: "44".tr, middleText: "48".tr);
    }
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await resetPasswordData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.successResetPassword);
        } else {
          Get.defaultDialog(title: "44".tr, middleText: "47".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  resetPassword() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    password = TextEditingController();
    rePassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    rePassword.dispose();
    super.dispose();
  }
}
