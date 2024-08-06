import 'dart:io';

import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import 'view_controller.dart';

class CategoriesAddController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController namear;

  File? file;

   StatusRequest? statusRequest = StatusRequest.none;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Chose Image SVG");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
      };
      var response = await categoriesData.add(data, file!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.categoriesview);
          CategoriesController c = Get.find();
          c.getData();
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    name = TextEditingController();
    namear = TextEditingController();
    super.onInit();
  }
}
