import 'package:e_commerce_app/core/constant/appColors.dart';
import 'package:flutter/material.dart';

class customTextFieldAuth extends StatelessWidget {
  final String labelText;
  final String hinttxet;
  final Widget? suffixIcon, visibelitySuffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function()? ontap;

  const customTextFieldAuth({
    super.key,
    required this.labelText,
    required this.hinttxet,
    required this.suffixIcon,
    this.obscureText,
    required this.keyboardType,
    required this.controller,
    required this.validator,
    this.ontap,
    this.visibelitySuffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25, left: 20, right: 20),
      child: TextFormField(
        style: TextStyle(
            color: appColors.accentblue.withOpacity(0.7),
            fontFamily: "sans",
            fontSize: 17),
        validator: validator,
        controller: controller,
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hinttxet,
          hintStyle:
              TextStyle(fontSize: 15, color: appColors.grey.withOpacity(0.3)),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(labelText,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(color: appColors.accentblue)),
          ),
          labelStyle: const TextStyle(color: appColors.LightBlue),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
          suffixIcon: InkWell(
            onTap: ontap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: obscureText == null || obscureText == true
                  ? suffixIcon
                  : visibelitySuffixIcon,
            ),
          ),
          suffixIconColor: appColors.accentblue,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
