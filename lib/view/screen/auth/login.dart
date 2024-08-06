import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtextsignup.dart';
import '../../widget/auth/customtexttitleauth.dart';
import '../../widget/auth/logoauth.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginCotrollerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "9".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColor.backGroundColor,
        ),
        body: WillPopScope(
          onWillPop: AlertExitApp,
          child: GetBuilder<LoginCotrollerImp>(
              builder: ((controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    child: Form(
                      key: controller.formState,
                      child: ListView(
                        children: [
                          const Logo(),
                          CustomTextTitleAuth(textTitle: "2".tr),
                          const SizedBox(
                            height: 1,
                          ),
                          CustomTextBodyAuth(textBody: "3".tr),
                          const SizedBox(
                            height: 15,
                          ),
                          CustomTextFormAuth(
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 100, "email");
                              },
                              myController: controller.email,
                              hintText: "4".tr,
                              label: "5".tr,
                              icon: Icons.email_outlined),
                          GetBuilder<LoginCotrollerImp>(
                              builder: ((controller) => CustomTextFormAuth(
                                    obscureText: controller.isShoowpass,
                                    isNumber: false,
                                    valid: (val) {
                                      return validInput(
                                          val!, 5, 30, "password");
                                    },
                                    myController: controller.password,
                                    hintText: "7".tr,
                                    label: "6".tr,
                                    icon: Icons.lock_outline,
                                    onTapIcon: () {
                                      controller.shoowPassword();
                                    },
                                  ))),
                          InkWell(
                            onTap: () {
                              controller.goToForegetPassword();
                            },
                            child: Text(
                              "8".tr,
                              textAlign: TextAlign.end,
                            ),
                          ),
                          CustomButtonAuth(
                            text: "9".tr,
                            onPressed: () {
                              controller.login();
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextSignUpOrSignIn(
                              text: "10".tr,
                              textTow: "11".tr,
                              onTap: () {
                                controller.goToSignUP();
                              })
                        ],
                      ),
                    ),
                  )))),
        ));
  }
}
