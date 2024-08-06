import 'dart:io';
import 'package:admin_ecommerce/controller/items/view_controller.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/data/datasource/remote/items.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/functions/uploadfile.dart';
import 'package:drop_down_list/drop_down_list.dart';

import '../../data/datasource/remote/categories.dart';

class ItemsAddController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());
  List<SelectedListItem> dropDownList = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController dropDownName;
  late TextEditingController dropDownId;
  late TextEditingController name;
  late TextEditingController namear;
  late TextEditingController describtion;
  late TextEditingController describtionar;
  late TextEditingController count;
  late TextEditingController price;
  late TextEditingController discount;

  TextEditingController? catid;
  TextEditingController? catName;

  File? file;

  StatusRequest? statusRequest = StatusRequest.none;

  showOptionImage() {
    showBottonMenu(chooseImageCamera, chooseImageGallery);
  }

  chooseImageCamera() async {
    file = await imageUploadCamera();
    update();
  }

  chooseImageGallery() async {
    file = await fileUploadGallery(false);
    update();
  }

  addData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) Get.snackbar("Warning", "Please Chose Image ");
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "name": name.text,
        "namear": namear.text,
        "desc" : describtion.text,
        "descar" : describtionar.text,
        "count" : count.text,
        "price" : price.text,
        "discount" : discount.text,
        "catid" : catid!.text,
        "datenow" : DateTime.now().toString(),
      };
      var response = await itemsData.add(data, file!);
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

  getCategory() async {
    CategoriesData categoriesData = CategoriesData(Get.find());
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List<CategoriesModel> data = [];
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
        for (int i = 0; i < data.length; i++) {
          dropDownList.add(SelectedListItem(
              name: data[i].categoriesName!,
              value: data[i].categoriesId.toString()));
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  showDropDown(context) {
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "title",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: [SelectedListItem(name: "a"), SelectedListItem(name: "b")],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedListItem = selectedList[0];
          dropDownName.text = selectedListItem.name;
          // List<String> list = [];
          // for (var item in selectedList) {
          //   if (item is SelectedListItem) {
          //     list.add(item.name);
          //   }
          // }
          // showSnackBar(list.toString());
        },
        // enableMultipleSelection: true,
      ),
    ).showModal(context);
  }

  @override
  void onInit() {
    getCategory();
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
    super.onInit();
  }
}
