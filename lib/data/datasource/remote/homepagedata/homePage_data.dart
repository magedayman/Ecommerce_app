import 'package:e_commerce_app/core/classes/Curd.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';

class HomepageData {
  Crud crud;

  HomepageData(this.crud);

  homepageData() async {
    var response = await crud.PostData(AppLinkApi.apiHomePage, {});

    return response.fold((l) => l, (r) => r);
  }

  searchItemsData(String search) async {
    var response = await crud.PostData(AppLinkApi.apiItemsSearch, {
      "search": search,
    });

    return response.fold((l) => l, (r) => r);
  }
}
