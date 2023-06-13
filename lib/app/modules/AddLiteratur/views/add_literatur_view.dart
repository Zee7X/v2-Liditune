import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_literatur_controller.dart';

class AddLiteraturView extends GetView<AddLiteraturController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF8058FB),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Add Literatur',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(),
    );
  }
}
