import 'dart:io';
import 'package:admin_ecommerce/controller/items/view_controller.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import '../../data/datasource/remote/items.dart';

class ItemsEditController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropDownList = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ItemsModel? itemsModel;
  late TextEditingController dropDownName;
  late TextEditingController dropDownId;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController describtion;
  late TextEditingController describtionar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;
  String? active;

  TextEditingController? catid;
  TextEditingController? catName;

  File? file;

  StatusRequest? statusRequest = StatusRequest.none;

  changeStatuseActive(val) {
    active = val;
    update();
  }

  chooseImage() async {
    file = await fileUploadGallery(true);
    update();
  }

  editData() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "id": itemsModel!.itemsId.toString(),
        "name": name.text,
        "namear": namear.text,
        "desc": describtion.text,
        "descar": describtionar.text,
        "count": count.text,
        "price": price.text,
        "discount": discount.text,
        "catid": catid!.text,
        "imageold": itemsModel!.itemsImage,
        "active": active,
        "datenow": DateTime.now().toString(),
      };
      var response = await itemsData.edit(data, file);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRoutes.itemsview);
          ItemsController c = Get.find();
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
    itemsModel = Get.arguments['itemsModel'];
    dropDownName = TextEditingController();
    dropDownId = TextEditingController();
    name = TextEditingController();
    namear = TextEditingController();
    describtion = TextEditingController();
    describtionar = TextEditingController();
    count = TextEditingController();
    price = TextEditingController();
    discount = TextEditingController();
    catName = TextEditingController();
    catid = TextEditingController();
    name.text = itemsModel!.itemsName as String;
    namear.text = itemsModel!.itemsNameAr as String;
    describtion.text = itemsModel!.itemsDesc as String;
    describtionar.text = itemsModel!.itemsDescAr as String;
    count.text = itemsModel!.itemsCount.toString();
    price.text = itemsModel!.itemsPrice.toString();
    discount.text = itemsModel!.itemsDiscount.toString();
    catid!.text = itemsModel!.categoriesId.toString();
    catName!.text = itemsModel!.categoriesName as String;
    active = itemsModel!.itemsActive.toString();
    super.onInit();
  }
}
