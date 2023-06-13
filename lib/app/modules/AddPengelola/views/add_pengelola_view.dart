import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_pengelola_controller.dart';

class AddPengelolaView extends GetView<AddPengelolaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddPengelolaView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddPengelolaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
