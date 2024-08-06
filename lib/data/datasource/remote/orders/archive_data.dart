import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData() async {
    var response =
        await crud.postData(AppLink.viewArchiveorders, {});
    return response.fold((l) => l, (r) => r);
  }
}
