import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/successresetpasswordlogin_cotroller.dart';
import '../../../../core/constant/color.dart';
import '../../../widget/auth/custombuttonauth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordLoginControllerImp controller =
        Get.put(SuccessResetPasswordLoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "29".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.backGroundColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            )),
            Text("31".tr, style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  text: "32".tr,
                  onPressed: () {
                    controller.goToPageLogin();
                  },
                )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
