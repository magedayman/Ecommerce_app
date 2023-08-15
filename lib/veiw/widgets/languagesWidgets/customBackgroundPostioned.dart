// ignore_for_file: camel_case_types, file_names

import 'dart:ui';

import 'package:flutter/material.dart';

class customBackgroundPostioned extends StatelessWidget {
  final double? top, left, bottom, right;
  final Color color;
  const customBackgroundPostioned(
      {super.key,
      this.top,
      this.left,
      this.bottom,
      this.right,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: top,
        left: left,
        bottom: bottom,
        right: right,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 170, sigmaY: 150),
              child: const SizedBox(
                height: 300,
                width: 300,
              )),
        ));
  }
}
