
// import 'package:ecomerce1/controller/auth/verfiycodesignup_controller.dart';
// import 'package:ecomerce1/view/widget/auth/customtextbodyauth.dart';
// import 'package:ecomerce1/view/widget/auth/customtexttitleauth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:get/get.dart';

// import '../../../core/constant/color.dart';

// class VerFiyCodeSignUp extends StatelessWidget {
//   const VerFiyCodeSignUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     VerFiyCodeSignUp_ControllerImp controller =
//         Get.put(VerFiyCodeSignUp_ControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "19".tr,
//           style: Theme.of(context)
//               .textTheme
//               .displayLarge
//               ?.copyWith(color: AppColor.grey),
//         ),
//         centerTitle: true,
//         elevation: 0.0,
//         backgroundColor: AppColor.backGroundColor,
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//         child: ListView(
//           children: [
//             CustomTextTitleAuth(textTitle: "20".tr),
//             const SizedBox(
//               height: 1,
//             ),
//             CustomTextBodyAuth(textBody: "22".tr),
//             const SizedBox(
//               height: 15,
//             ),
//             OtpTextField(
//               fieldWidth: 50.0,
//               borderRadius: BorderRadius.circular(20.0),
//               numberOfFields: 5,
//               borderColor: const Color(0xFF512DA8),
//               //set to true to show as box or false to show as dash
//               showFieldAsBox: true,
//               //runs when a code is typed in
//               onCodeChanged: (String code) {
//                 //handle validation or checks here
//               },
//               //runs when every textfield is filled
//               onSubmit: (String verificationCode) {
//                 controller.goToSuccessSignUp();
//               }, // end onSubmit
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
