import 'dart:io';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import 'view_controller.dart';

class CategoriesEditController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CategoriesModel? categoriesModel;

  late TextEditingController name;
  late TextEditingController namear;

  File? file;

  StatusRequest? statusRequest = StatusRequest.none;

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id" : categoriesModel!.categoriesId.toString(),
        "name": name.text,
        "namear": namear.text,
        "imageold" : categoriesModel!.categoriesImage,
      };
      var response = await categoriesData.edit(data, file);
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
    categoriesModel = Get.arguments['categoriesModel'];
    name = TextEditingController();
    namear = TextEditingController();
    name.text = categoriesModel!.categoriesName as String;
    namear.text = categoriesModel!.categoriesNameAr as String;
    super.onInit();
  }
}
