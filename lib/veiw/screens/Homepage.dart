import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/HomeController/HomepageController.dart';
import 'package:e_commerce_app/core/classes/Handling_data_View.dart';
import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:e_commerce_app/core/constant/appLinkApi.dart';
import 'package:e_commerce_app/data/model/ItemsModel.dart';
import 'package:e_commerce_app/veiw/widgets/HomepageWidget/CustomItemsHome.dart';
import 'package:e_commerce_app/veiw/widgets/HomepageWidget/CustomTitleHome.dart';
import 'package:e_commerce_app/veiw/widgets/customHomeAppbar.dart';
import 'package:e_commerce_app/veiw/widgets/HomepageWidget/HeaderHomeCard.dart';
import 'package:e_commerce_app/veiw/widgets/HomepageWidget/customHomeCategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Homepage extends GetView<HomepageControllerImp> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return GetBuilder<HomepageControllerImp>(
      builder: (controller) => LiquidPullToRefresh(
        color: appColors.primaryColor,
        backgroundColor: appColors.white,
        springAnimationDurationInMilliseconds: 300,
        showChildOpacityTransition: false,
        onRefresh: onRefresh,
        child: ListView(
          children: [
            CustomHomeAppbar(
              txtfieldcontroller: controller.search,
              title: "Search products",
              onSearchIcon: () {
                controller.onSearchItems();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              onFavorite: () {
                controller.gotoFavorite();
              },
            ),
            GetBuilder<HomepageControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch
                    ? SearcItemsResult(listModel: controller.searchItemsList)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.settings.isNotEmpty)
                            CustomHomeCard(
                                title: "${controller.cardTitle}",
                                body: "${controller.cardBody}"),
                          const CustomTitleHome(
                            title: "Categories",
                            icon: Icons.fitbit_rounded,
                            color: appColors.primaryColor,
                          ),
                          const CustomHomeCategories(),
                          const CustomTitleHome(
                            title: "Top selling",
                            icon: Icons.local_fire_department_outlined,
                            color: appColors.primaryColor,
                          ),
                          const CustomItemsHome(),
                          // CustomTitleHome(title: "Offers"),
                          // CustomItemsHome(),
                        ],
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }

// to refersh homepage
  Future<void> onRefresh() async {
    controller.categories.clear();
    controller.items.clear();
    await controller.getHomepageData();
  }
}

class SearcItemsResult extends GetView<HomepageControllerImp> {
  final List<ItemsModel> listModel;
  const SearcItemsResult({super.key, required this.listModel});

  @override
  Widget build(BuildContext context) {
    Get.put(HomepageControllerImp());
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2),
      itemCount: controller.searchItemsList.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [
                            appColors.primaryColor.withOpacity(0.7),
                            appColors.primaryColor.withOpacity(0.3),
                            appColors.primaryColor.withOpacity(0.0001)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  height: 200,
                  width: 200,
                  child: CachedNetworkImage(
                      fit: BoxFit.scaleDown,
                      imageUrl:
                          "${AppLinkApi.apiItemsImage}/${listModel[index].itemsImage}"),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${listModel[index].itemsName}",
                        style: const TextStyle(
                            color: appColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Price :${listModel[index].itemsPrice} \$",
                        style: const TextStyle(
                            color: appColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          controller.goToItemsDetails(listModel[index]);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: appColors.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: const Text(
                            "See More",
                            style: TextStyle(
                                color: appColors.primaryColor, fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ]),
        );
      },
    );
  }
}
