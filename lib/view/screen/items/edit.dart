import 'package:admin_ecommerce/controller/items/add_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/color.dart';
import 'package:admin_ecommerce/core/functions/validinput.dart';
import 'package:admin_ecommerce/core/shared/customTextFormGlobal.dart';
import 'package:admin_ecommerce/core/shared/custom_button.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../controller/items/edit_controller.dart';
import '../../../core/shared/customDropDownSearch.dart';

class ItemsEdit extends StatelessWidget {
  const ItemsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsEditController controller = Get.put(ItemsEditController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Items"),
        ),
        body: GetBuilder<ItemsEditController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          CustomTextFormGlobal(
                              hintText: "items  name",
                              label: "items  name",
                              icon: Icons.category,
                              myController: controller.name,
                              valid: (val) {
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hintText: "items  name (Arabic)",
                              label: "items  name (Arabic)",
                              icon: Icons.category,
                              myController: controller.namear,
                              valid: (val) {
                                return validInput(val!, 1, 50, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hintText: "describtion  name",
                              label: "describtion  name",
                              icon: Icons.category,
                              myController: controller.describtion,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hintText: "describtion  name (Arabic)",
                              label: "describtion  name (Arabic)",
                              icon: Icons.category,
                              myController: controller.describtionar,
                              valid: (val) {
                                return validInput(val!, 1, 200, "");
                              },
                              isNumber: false),
                          CustomTextFormGlobal(
                              hintText: "count",
                              label: "count ",
                              icon: Icons.category,
                              myController: controller.count,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hintText: "price",
                              label: "price ",
                              icon: Icons.category,
                              myController: controller.price,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomTextFormGlobal(
                              hintText: "discount",
                              label: "discount ",
                              icon: Icons.category,
                              myController: controller.discount,
                              valid: (val) {
                                return validInput(val!, 1, 30, "");
                              },
                              isNumber: true),
                          CustomDropDownSearch(
                            title: "Chooes Category",
                            listData: controller.dropDownList,
                            dropDownSelectedName: controller.catName!,
                            dropDownSelectedId: controller.catid!,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RadioListTile(
                            title: Text("hiddden"),
                            value: "0",
                            groupValue: controller.active,
                            onChanged: (val) {
                              controller.changeStatuseActive(val);
                            },
                          ),
                          RadioListTile(
                            title: Text("active"),
                            value: "1",
                            groupValue: controller.active,
                            onChanged: (val) {
                              controller.changeStatuseActive(val);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: MaterialButton(
                              color: AppColor.thirdColor,
                              textColor: AppColor.primaryColor,
                              onPressed: () {
                                // controller.showOptionImage();
                              },
                              child: const Text("Choose items image"),
                            ),
                          ),
                          if (controller.file != null)
                            // SvgPicture.file(
                            //   controller.file!,
                            //   height: Get.height * 0.2,
                            // ),
                            Image.file(
                              controller.file!,
                              height: Get.height * 0.2,
                            ),
                          CustomButton(
                            text: "save",
                            onPressed: () {
                              controller.editData();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
