import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/pending_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/order_model.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrderModel listdata;
  const CardOrdersList({super.key, required this.listdata});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "OrderNumber: ${listdata.ordersId.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  Jiffy("${listdata.ordersDatetime}", "yyyy-MM-dd").fromNow(),
                  style: const TextStyle(
                      fontFamily: "sans",
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            // Text(
            //     "Order Type : ${controller.printOrderType(listdata.ordersType.toString())}"),
            Text("Order Price : ${listdata.ordersPrice} \$"),
            Text("Delivery Price : ${listdata.ordersPricedelivery} \$"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listdata.ordersPaymentmethod.toString())}"),
            // Text(
            //     "Order  Status : ${controller.printOrderStatuse(listdata.ordersStatuse.toString())}"),
            const Divider(),
            Row(
              children: [
                Text(
                  "Total Price: ${listdata.ordersTotalprice} \$",
                  style: const TextStyle(
                      fontFamily: "sans",
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  color: AppColor.thirdColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                  child: MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ordersdetails,
                          arguments: {"ordersModel": listdata});
                    },
                    child: const Text(
                      "Details",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (listdata.ordersStatuse.toString() == "0")
                  Container(
                    color: AppColor.thirdColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    child: MaterialButton(
                      onPressed: () {
                        // controller.deleteOrder(listdata.ordersId.toString());
                        controller.approveOrders(listdata.ordersId.toString(),
                            listdata.ordersUsersid.toString());
                      },
                      child: const Text(
                        "Approve",
                        style: TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
