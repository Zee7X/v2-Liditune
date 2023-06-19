import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:literasi_digital_tuna_netra/app/routes/app_pages.dart';

import '../controllers/pengelola_controller.dart';

class PengelolaView extends GetView<PengelolaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Pengelola'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person_2_outlined),
            onPressed: () {
              Get.toNamed(Routes.ADD_PENGELOLA);
            },
          ),
        ],
        backgroundColor: const Color(0xFF240B74),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF240B74),
              const Color(0xFF0A0B0D),
            ],
          ),
        ),
      ),
    );
  }
}
