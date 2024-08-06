import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/screen_controller.dart';
import '../../../core/constant/color.dart';
import '../../widget/orders/custombottomappbarhome.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderScreenControllerImp controllerImp =
        Get.put(OrderScreenControllerImp());
    return GetBuilder<OrderScreenControllerImp>(
        builder: ((controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Orders"),
              ),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: controller.listPage.elementAt(controller.cureentPage),
            )));
  }
}
