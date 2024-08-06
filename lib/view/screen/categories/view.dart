import 'package:admin_ecommerce/controller/categories/view_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Categories"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.categoriesadd);
            },
            child: const Icon(Icons.add)),
        body: GetBuilder<CategoriesController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: WillPopScope(
              onWillPop: () {
                return controller.myBack();
              },
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: controller.data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller
                              .goToPgeEditCategory(controller.data[index]);
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: SvgPicture.network(
                                    height: Get.height / 8.5,
                                    "${AppLink.imagesCategories}/${controller.data[index].categoriesImage}"),
                              )),
                              Expanded(
                                  flex: 3,
                                  child: ListTile(
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              Get.defaultDialog(
                                                title: "تحذير",
                                                middleText:
                                                    "هل أنت متأكد من عملية الحذف",
                                                onCancel: () {},
                                                onConfirm: () {
                                                  controller.deleteCategory(
                                                      controller.data[index]
                                                          .categoriesId!
                                                          .toString(),
                                                      controller.data[index]
                                                          .categoriesImage!);
                                                  Get.back();
                                                },
                                              );
                                            },
                                            icon: const Icon(Icons.delete)),
                                        // IconButton(
                                        //     onPressed: () {
                                        //       controller.goToPgeEditCategory(
                                        //           controller.data[index]);
                                        //     },
                                        //     icon: const Icon(Icons.edit)),
                                      ],
                                    ),
                                    title: Text(
                                        "${controller.data[index].categoriesName}"),
                                    subtitle: Text(
                                      "${controller.data[index].categoriesDatetime}",
                                      style:
                                          const TextStyle(fontFamily: "sans"),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ),
        ));
  }
}
