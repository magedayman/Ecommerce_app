import 'package:e_commerce_app/core/functions/check_internet.dart';
import 'package:flutter/material.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  oncheckInternet() async {
    var result = await checkInternet();
    print(result);
  }

  @override
  void initState() {
    oncheckInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Title'),
        ),
        body: Column(
          children: [Text("heloooooo")],
        ));
  }
}
