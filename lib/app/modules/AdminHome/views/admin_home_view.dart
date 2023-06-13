import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:literasi_digital_tuna_netra/app/routes/app_pages.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // leading: IconButton(
        //   color: Colors.white,
        //   icon: const Icon(
        //     Icons.exit_to_app_rounded,
        //   ),
        //   onPressed: () => controller.logout(),
        // ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.add_sharp,
              color: Colors.white,
            ),
            onPressed: () {
              Get.toNamed(Routes.ADD_PENGELOLA);
            },
          ),
          IconButton(
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                Get.toNamed(Routes.PROFILE);
              })
        ],
        backgroundColor: const Color(0XFF8058FB),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Admin',
          style: TextStyle(color: Colors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
