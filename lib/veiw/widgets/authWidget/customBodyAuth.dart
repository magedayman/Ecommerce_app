// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  CustomBodyAuth({super.key, required this.textBody, this.color});

  final String textBody;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
      child: Center(
        child: Text(
          textBody,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              height: 2,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color),
        ),
      ),
    );
  }
}
