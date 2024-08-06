import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersDetailsData {
  Crud crud;
  OrdersDetailsData(this.crud);

  getData(String ordersid) async {
    var response =
        await crud.postData(AppLink.detailsOrders, {"id": ordersid.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
