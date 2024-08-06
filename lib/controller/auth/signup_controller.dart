// import 'package:ecomerce1/core/class/statusrequest.dart';
// import 'package:ecomerce1/core/constant/routes.dart';
// import 'package:ecomerce1/core/functions/handlingdatacontroller.dart';
// import 'package:ecomerce1/data/datasource/remote/auth/signup.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';


// abstract class SignUpController extends GetxController {
//   signUp();
//   goToSignIn();
// }

// class SignUpControllerImp extends SignUpController {
//   GlobalKey<FormState> formState = GlobalKey<FormState>();

//   late TextEditingController userName;
//   late TextEditingController email;
//   late TextEditingController phone;
//   late TextEditingController password;

//   StatusRequest statusRequest = StatusRequest.none;
//   SignUpData signUpData = SignUpData(Get.find());

//   List data = [];

//   bool isShoowpass = true;
//   shoowPassword() {
//     isShoowpass = isShoowpass == true ? false : true;
//     update();
//   }

//   @override
//   goToSignIn() {
//     Get.offNamed(AppRoutes.login);
//   }

//   @override
//   signUp() async {
//     if (formState.currentState!.validate()) {
//       statusRequest = StatusRequest.loading;
//       update();
//       var response = await signUpData.postData(
//           userName.text, password.text, email.text, phone.text);
//       statusRequest = handlingData(response);
//       if (StatusRequest.success == statusRequest) {
//         if (response['status'] == "success") {
//           //data.addAll(response['data']);
//           Get.offNamed(AppRoutes.successSignUp);
//         } else {
//           Get.defaultDialog(
//               title: "44".tr,
//               middleText: "45".tr);
//           statusRequest = StatusRequest.failure;
//         }
//       }
//       update();
//     } else {}
//   }

//   @override
//   void onInit() {
//     userName = TextEditingController();
//     email = TextEditingController();
//     phone = TextEditingController();
//     password = TextEditingController();
//     super.onInit();
//   }

//   @override
//   void dispose() {
//     userName.dispose();
//     email.dispose();
//     phone.dispose();
//     password.dispose();
//     super.dispose();
//   }
// }
