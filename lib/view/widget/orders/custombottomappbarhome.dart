import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/screen_controller.dart';
import '../home/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderScreenControllerImp>(builder: ((controller) {
      return BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Row(
            children: [
              ...List.generate(controller.listPage.length, (index) {
                return Expanded(
                  child: CustomButtonAppBar(
                      onPressed: () {
                        controller.changePage(index);
                      },
                      textbutton: "${controller.buttonAppBar[index]["title"]}",
                      iconData: controller.buttonAppBar[index]["icon"],
                      active: controller.cureentPage == index ? true : false),
                );
              })
            ],
          ));
    }));
  }
}
