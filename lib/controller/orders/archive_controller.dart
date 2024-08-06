import 'package:get/get.dart';
import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingdatacontroller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders/archive_data.dart';
import '../../data/model/order_model.dart';

class OrdersArchiveController extends GetxController {
  OrdersArchiveData ordersArchiveData = OrdersArchiveData(Get.find());
  List<OrderModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  String printOrderType(String val) {
    if (val == "0") {
      return "delivery";
    } else {
      return "Recive";
    }
  }

  String printPaymentMethod(String val) {
    if (val == "0") {
      return "Cash On Delivery";
    } else {
      return "Payment Card";
    }
  }

  String printOrderStatuse(String val) {
    if (val == "0") {
      return "Pending Approval";
    } else if (val == "1") {
      return "The Order is being Prepared ";
    } else if (val == "2") {
      return "Ready To Picked up by Delivery man";
    } else if (val == "3") {
      return "On The Way";
    } else {
      return "Archive";
    }
  }

  getOrder() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersArchiveData
        .getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => OrderModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  refreshOrder() {
    getOrder();
  }

  @override
  void onInit() {
    getOrder();
    super.onInit();
  }
}
