import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  donePepare(String ordersid, String userid, String ordertype) async {
    var response = await crud.postData(AppLink.pepare,
        {"ordersid": ordersid, "userid": userid, "ordertype": ordertype});
    return response.fold((l) => l, (r) => r);
  }
}
