import 'package:flutter/material.dart';

class HeaderTitleCheckout extends StatelessWidget {
  const HeaderTitleCheckout({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        textAlign: TextAlign.start,
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}
