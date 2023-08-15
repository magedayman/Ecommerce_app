import 'package:e_commerce_app/core/constant/imageAssets.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: 150,
      width: 150,
      child: Image.asset(
        AppimageAssets.appLogo,
        fit: BoxFit.cover,
      ),
    );
  }
}
