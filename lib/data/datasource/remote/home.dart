import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.hpmePage, {});
    return response.fold((l) => l, (r) => r);
  }
}
