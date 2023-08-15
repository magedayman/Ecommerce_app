import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomHomeAppbar extends StatelessWidget {
  final String title;
  final void Function()? onSearchIcon;
  final void Function()? onFavorite;
  final void Function(String)? onChanged;
  final TextEditingController? txtfieldcontroller;

  const CustomHomeAppbar({
    super.key,
    required this.title,
    required this.onSearchIcon,
    required this.onFavorite,
    required this.onChanged,
    required this.txtfieldcontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
            height: Get.height * 0.06,
            child: Form(
                child: TextFormField(
              controller: txtfieldcontroller,
              onChanged: onChanged,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  hintText: title,
                  hintStyle: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 16, fontWeight: FontWeight.w100),
                  filled: true,
                  fillColor: appColors.primaryColor.withOpacity(0.2),
                  prefixIcon: IconButton(
                      onPressed: onSearchIcon,
                      icon: const Icon(
                        Icons.search_rounded,
                        size: 30,
                        color: appColors.primaryColor,
                      ))),
            )),
          )),
          const SizedBox(width: 5),
          Container(
            height: Get.height * 0.06,
            width: Get.height * 0.06,
            decoration: BoxDecoration(
                color: appColors.primaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15)),
            child: IconButton(
                iconSize: 27,
                color: appColors.primaryColor,
                splashRadius: 35,
                onPressed: onFavorite,
                icon: const Icon(Icons.favorite_border_outlined)),
          )
        ],
      ),
    );
  }
}
