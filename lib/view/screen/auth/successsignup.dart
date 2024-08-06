// import 'package:ecomerce1/controller/auth/successsignup_controller.dart';
// import 'package:ecomerce1/core/constant/color.dart';
// import 'package:ecomerce1/view/widget/auth/custombuttonauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SuccessSignUp extends StatelessWidget {
//   const SuccessSignUp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     SuccessSignUpControllerImp controller =
//         Get.put(SuccessSignUpControllerImp());
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "29".tr,
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
//         padding: const EdgeInsets.all(15),
//         child: Column(
//           children: [
//             const Center(
//                 child: Icon(
//               Icons.check_circle_outline,
//               size: 200,
//               color: AppColor.primaryColor,
//             )),
//             Text("35".tr, style: Theme.of(context).textTheme.bodyLarge),
//             const Spacer(),
//             SizedBox(
//                 width: double.infinity,
//                 child: CustomButtonAuth(
//                   text: "32".tr,
//                   onPressed: () {
//                     controller.goToPageLogin();
//                   },
//                 )),
//             const SizedBox(
//               height: 30,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
