import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/details_controller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../../core/constant/color.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          child: GetBuilder<OrdersDetailsController>(
            builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Table(
                          children: [
                            const TableRow(children: [
                              Text(
                                "Item",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "QIY",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Price",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]),
                            // TableRow(children: [
                            //   Text(
                            //     "macbpck",
                            //     textAlign: TextAlign.center,
                            //   ),
                            //   Text(
                            //     "1",
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(fontFamily: "sans"),
                            //   ),
                            //   Text(
                            //     "2400\$",
                            //     textAlign: TextAlign.center,
                            //     style: TextStyle(fontFamily: "sans"),
                            //   )
                            // ]),
                            ...List.generate(
                              controller.data.length,
                              (index) => TableRow(children: [
                                Text(
                                  "${controller.data[index].itemsName} ",
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  "${controller.data[index].countitems}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontFamily: "sans"),
                                ),
                                Text(
                                  "${controller.data[index].itemsPrice}\$",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontFamily: "sans"),
                                )
                              ]),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            "Total Price : ${controller.orderModel.ordersTotalprice}\$",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: "sans",
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  if (controller.orderModel.ordersType.toString() == "0")
                    Card(
                      child: Container(
                        child: ListTile(
                          title: const Text(
                            "Shipping Addres",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                              "${controller.orderModel.addressCity} ${controller.orderModel.addressStreet}"),
                        ),
                      ),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
