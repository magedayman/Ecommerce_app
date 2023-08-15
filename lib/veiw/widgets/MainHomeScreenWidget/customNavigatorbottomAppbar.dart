import 'package:e_commerce_app/controller/HomeController/MainHomeScreenController.dart';
import 'package:e_commerce_app/veiw/widgets/MainHomeScreenWidget/CustomButtonsBottomappBar.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class NavigatorbottomAppbar extends StatelessWidget {
  const NavigatorbottomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeScreenControllerImp>(
      builder: (controller) => Row(
        children: [
          ...List.generate(controller.PagesList.length + 1, (index) {
            int i = index > 2 ? index - 1 : index;
            return index == 2
                ? const Spacer()
                : CustomButtonsBottomappBar(
                    active: controller.currentpage == i ? true : false,
                    staticIcon: controller.appBarIcon[i],
                    iconData: controller.outlineAppBarIcon[i],
                    tilte: controller.bottomBarTitl[i],
                    onPressed: () {
                      controller.changePage(i);
                    },
                  );
          }),
        ],
      ),
    );
  }
}
