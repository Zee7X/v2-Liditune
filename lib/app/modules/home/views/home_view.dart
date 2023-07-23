import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/menu.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    controller.speakText();
    return Scaffold(
      backgroundColor: const Color(0x00161616),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  controller.onUserInteraction();
                  controller.stopSpeaking();
                  Get.toNamed(Routes.LITERATUR);
                },
                //Literatur
                child: Menu(
                  bgcolor: const Color(0XFFFF3589),
                  ico: Lottie.asset(
                    'assets/images/book.json',
                  ),
                  t1: 'Literatur',
                  t2: 'Fitur untuk melakukan kegiatan Literasi dengan buku yang tersedia',
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    controller.stopSpeaking();
                    controller.voidPress();
                    controller.onUserInteraction();
                  },
                  onLongPress: () {
                    Get.toNamed(Routes.LOGIN);
                    controller.LongPressVoid();
                    controller.onUserInteraction();
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  controller.stopSpeaking();
                  Get.toNamed(Routes.SCAN_QR);
                  controller.onUserInteraction();
                },
                //QR
                child: Menu(
                  bgcolor: const Color(0XFFFFAE5F),
                  ico: Lottie.asset(
                    'assets/images/qr.json',
                  ),
                  t1: 'Scan QR',
                  t2: 'Fitur untuk pemindaian qr dengan beberapa data yang sudah terdaftar di sistem',
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    controller.stopSpeaking();
                    controller.voidPress();
                    controller.onUserInteraction();
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  controller.stopSpeaking();
                  Get.toNamed(Routes.SCAN_OCR);
                  controller.onUserInteraction();
                },
                //Bacakan
                child: Menu(
                  bgcolor: const Color(0XFF8058FB),
                  ico: Lottie.asset(
                    'assets/images/camera.json',
                  ),
                  t1: 'Bacakan',
                  t2: 'Fitur untuk melakukan pemindaian sebuah tulisan dengan cara mengambil gambar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
