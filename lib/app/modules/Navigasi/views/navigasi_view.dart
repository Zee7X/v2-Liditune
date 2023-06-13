import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AddLiteratur/views/add_literatur_view.dart';
import 'package:literasi_digital_tuna_netra/app/modules/AdminHome/views/admin_home_view.dart';

import '../controllers/navigasi_controller.dart';

class NavigasiView extends GetView<NavigasiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            AdminHomeView(),
            AddLiteraturView(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withOpacity(0.20),
                blurRadius: 5,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0XFF8058FB),
              currentIndex: controller.currentIndex.value,
              onTap: controller.changeTab,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: 'Admin',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book),
                  label: 'Add Literatur',
                ),
              ],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: false,
            ),
          ),
        ),
      ),
    );
  }
}
