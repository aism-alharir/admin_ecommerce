// import 'package:ecomerce1/controller/auth/signup_controller.dart';
// import 'package:ecomerce1/core/class/handlingdataview.dart';
// import 'package:ecomerce1/core/constant/color.dart';
// import 'package:ecomerce1/core/functions/alertexitapp.dart';
// import 'package:ecomerce1/core/functions/validinput.dart';
// import 'package:ecomerce1/view/widget/auth/custombuttonauth.dart';
// import 'package:ecomerce1/view/widget/auth/customtextbodyauth.dart';
// import 'package:ecomerce1/view/widget/auth/customtextformauth.dart';
// import 'package:ecomerce1/view/widget/auth/customtextsignup.dart';
// import 'package:ecomerce1/view/widget/auth/customtexttitleauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SignUp extends StatelessWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Get.lazyPut(() => SignUpControllerImp(), fenix: true);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "11".tr,
//             style: Theme.of(context)
//                 .textTheme
//                 .displayLarge
//                 ?.copyWith(color: AppColor.grey),
//           ),
//           centerTitle: true,
//           elevation: 0.0,
//           backgroundColor: AppColor.backGroundColor,
//         ),
//         body: WillPopScope(
//           onWillPop: AlertExitApp,
//           child: GetBuilder<SignUpControllerImp>(
//             builder: (controller) => HandlingDataRequest(
//               statusRequest: controller.statusRequest,
//               widget: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
//                 child: Form(
//                   key: controller.formState,
//                   child: ListView(
//                     children: [
//                       CustomTextTitleAuth(textTitle: "2".tr),
//                       const SizedBox(
//                         height: 1,
//                       ),
//                       CustomTextBodyAuth(textBody: "3".tr),
//                       const SizedBox(
//                         height: 15,
//                       ),
//                       CustomTextFormAuth(
//                           isNumber: false,
//                           valid: (val) {
//                             return validInput(val!, 5, 30, "username");
//                           },
//                           myController: controller.userName,
//                           hintText: "13".tr,
//                           label: "12".tr,
//                           icon: Icons.person_outline),
//                       CustomTextFormAuth(
//                           isNumber: false,
//                           valid: (val) {
//                             return validInput(val!, 5, 30, "email");
//                           },
//                           myController: controller.email,
//                           hintText: "4".tr,
//                           label: "5".tr,
//                           icon: Icons.email_outlined),
//                       CustomTextFormAuth(
//                           isNumber: true,
//                           valid: (val) {
//                             return validInput(val!, 10, 30, "phone");
//                           },
//                           myController: controller.phone,
//                           hintText: "15".tr,
//                           label: "14".tr,
//                           icon: Icons.phone_android_outlined),
//                       CustomTextFormAuth(
//                           obscureText: controller.isShoowpass,
//                           onTapIcon: () {
//                             controller.shoowPassword();
//                           },
//                           isNumber: false,
//                           valid: (val) {
//                             return validInput(val!, 5, 30, "password");
//                           },
//                           myController: controller.password,
//                           hintText: "7".tr,
//                           label: "6".tr,
//                           icon: Icons.lock_outline),
//                       CustomButtonAuth(
//                         text: "11".tr,
//                         onPressed: () {
//                           controller.signUp();
//                         },
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       CustomTextSignUpOrSignIn(
//                           text: "16".tr,
//                           textTow: "9".tr,
//                           onTap: () {
//                             controller.goToSignIn();
//                           })
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
// }
