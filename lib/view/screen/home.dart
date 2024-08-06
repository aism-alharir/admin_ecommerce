import 'package:admin_ecommerce/core/constant/imageasset.dart';
import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../widget/home/cardAdminHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller = Get.put(HomeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            children: [
              CardAdminHome(
                  onClick: () {
                    Get.toNamed(AppRoutes.categoriesview);
                  },
                  urlimage: AppImageAsset.categories,
                  tiile: "Categories"),
              CardAdminHome(
                  onClick: () {
                    Get.toNamed(AppRoutes.itemsview);
                  },
                  urlimage: AppImageAsset.prouduct,
                  tiile: "Items"),
              CardAdminHome(
                  onClick: () {},
                  urlimage: AppImageAsset.users,
                  tiile: "Users"),
              CardAdminHome(
                  onClick: () {
                    Get.toNamed(AppRoutes.orderscrren);
                  },
                  urlimage: AppImageAsset.orders,
                  tiile: "Orders"),
              CardAdminHome(
                  onClick: () {},
                  urlimage: AppImageAsset.report,
                  tiile: "Report"),
              CardAdminHome(
                  onClick: () {},
                  urlimage: AppImageAsset.notifaction,
                  tiile: "Notification"),
            ],
          ),
        ],
      ),
    );
  }
}
