import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/literatur_controller.dart';

class LiteraturView extends GetView<LiteraturController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LiteraturView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LiteraturView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
