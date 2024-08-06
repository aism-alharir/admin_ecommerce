import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/data/datasource/remote/items.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:admin_ecommerce/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class ItemsController extends GetxController {
  ItemsData itemsData = ItemsData(Get.find());

  List<ItemsModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await itemsData.get();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteItems(String id, String imagename) {
    itemsData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.itemsId.toString() == id);
    // getData();
    update();
  }

  goToPgeEditItems(ItemsModel itemsModel) {
    Get.toNamed(AppRoutes.itemsedit, arguments: {"itemsModel": itemsModel});
  }

  myBack() {
    Get.offAllNamed(AppRoutes.homePage);
    return Future.value(false);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
