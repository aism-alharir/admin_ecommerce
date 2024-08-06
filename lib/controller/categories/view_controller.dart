import 'package:admin_ecommerce/core/constant/routes.dart';
import 'package:admin_ecommerce/data/datasource/remote/categories.dart';
import 'package:admin_ecommerce/data/model/categoriesmodel.dart';
import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';

class CategoriesController extends GetxController {
  CategoriesData categoriesData = CategoriesData(Get.find());

  List<CategoriesModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoriesData.get();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List datalist = response['data'];
        data.addAll(datalist.map((e) => CategoriesModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteCategory(String id, String imagename) {
    categoriesData.delete({"id": id, "imagename": imagename});
    data.removeWhere((element) => element.categoriesId.toString() == id);
    // getData();
    update();
  }

  goToPgeEditCategory(CategoriesModel categoriesModel) {
    Get.toNamed(AppRoutes.categoriesedit,
        arguments: {"categoriesModel": categoriesModel});
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
