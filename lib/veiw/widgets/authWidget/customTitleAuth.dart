import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  final String texttitle;

  const CustomAuthTitle({super.key, required this.texttitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Center(
        child: Text(
          texttitle,
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    );
  }
}
