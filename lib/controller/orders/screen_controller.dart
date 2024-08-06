import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screen/orders/accepted.dart';
import '../../view/screen/orders/archive.dart';
import '../../view/screen/orders/pending.dart';

abstract class OrderScreenController extends GetxController {
  changePage(int index);
}

class OrderScreenControllerImp extends OrderScreenController {
  // CartController cartController = Get.put(CartController());
  int cureentPage = 0;
  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),
  ];
  List buttonAppBar = [
    {"title": "Pending", "icon": Icons.pending_outlined},
    {"title": "Accepted", "icon": Icons.access_time_sharp},
    {"title": "Archive", "icon": Icons.archive_outlined},
  ];

  @override
  changePage(int index) {
    cureentPage = index;
    update();
  }
}
