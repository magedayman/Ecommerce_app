import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class ItemData {
  Crud crud;

  ItemData(this.crud);

  onPostItemData(String id, String userid) async {
    var response = await crud.PostData(AppLinkApi.apiItemspage, {
      "id": id.toString(),
      "userid": userid,
    });

    return response.fold((l) => l, (r) => r);
  }
}
