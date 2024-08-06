import 'package:admin_ecommerce/controller/categories/add_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/functions/uploadfile.dart';
import 'package:admin_ecommerce/core/functions/validinput.dart';
import 'package:admin_ecommerce/core/shared/customTextFormGlobal.dart';
import 'package:admin_ecommerce/core/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/categories/edit_controller.dart';

class CategoriesEdit extends StatelessWidget {
  const CategoriesEdit({super.key});

  @override
  Widget build(BuildContext context) {
    CategoriesEditController controller = Get.put(CategoriesEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Categories"),
        ),
        body: GetBuilder<CategoriesEditController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hintText: "category  name",
                              label: "category  name",
                              icon: Icons.category,
                              myController: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hintText: "category  name (Arabic)",
                              label: "category  name (Arabic)",
                              icon: Icons.category,
                              myController: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: false),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.thirdColor,
                              textColor: AppColor.primaryColor,
                              onPressed: () {
                                controller.chooseImage();
                              },
                              child: const Text("Choose category image"),
                            ),
                          ),
                          if (controller.file != null)
                            // Image.file(controller.file!),
                            SvgPicture.file(
                              controller.file!,
                              height: Get.height * 0.2,
                            ),
                          CustomButton(
                            text: "save",
                            onPressed: () {
                              controller.editData();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
