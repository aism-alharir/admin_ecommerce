import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewPendeingOrder, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrder(String ordersid, String userid) async {
    var response = await crud.postData(AppLink.approveOrder,
        {"ordersid": ordersid, "userid": userid,});
    return response.fold((l) => l, (r) => r);
  }
}
