import 'package:admin_ecommerce/controller/items/view_controller.dart';
import 'package:admin_ecommerce/core/class/handlingdataview.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsController());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Items"),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(AppRoutes.itemsadd);
            },
            child: const Icon(Icons.add)),
        body: GetBuilder<ItemsController>(
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
                          controller.goToPgeEditItems(controller.data[index]);
                        },
                        child: Card(
                          child: Row(
                            children: [
                              Expanded(
                                  child: Container(
                                child: CachedNetworkImage(
                                    height: Get.height / 8.5,
                                    imageUrl:
                                        "${AppLink.imagesItems}/${controller.data[index].itemsImage}"),
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
                                                  controller.deleteItems(
                                                      controller
                                                          .data[index].itemsId!
                                                          .toString(),
                                                      controller.data[index]
                                                          .itemsImage!);
                                                  Get.back();
                                                },
                                              );
                                            },
                                            icon: const Icon(
                                                Icons.delete_outline)),
                                        // IconButton(
                                        //     onPressed: () {
                                        //       controller.goToPgeEditItems(
                                        //           controller.data[index]);
                                        //     },
                                        //     icon: const Icon(Icons.edit)),
                                      ],
                                    ),
                                    title: Text(
                                        "${controller.data[index].itemsName}"),
                                    subtitle: Text(
                                      "${controller.data[index].categoriesName}",
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
