import 'package:e_commerce_app/controller/FavoriteScreenController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/veiw/widgets/favoriteScreenWidget/customFavoriteCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteScreenControllerImp());
    return Scaffold(
        body: ListView(
      children: [
        // CustomHomeAppbar(
        //   title: "Search products",
        //   onSearchIcon: () {},
        //   onFavorite: () {},
        // ),
        GetBuilder<FavoriteScreenControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.favoritedataList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.6),
                itemBuilder: (context, index) {
                  return CustomFavoriteCard(
                      favoriteModel: controller.favoritedataList[index]);
                },
              )),
        )
      ],
    ));
  }
}
