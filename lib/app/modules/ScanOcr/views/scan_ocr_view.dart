import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/menu.dart';
import '../controllers/scan_ocr_controller.dart';

class ScanOcrView extends GetView<ScanOcrController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GetBuilder<ScanOcrController>(
        init: ScanOcrController(),
        builder: (controller) {
          final cameraController = controller.cameraController.value;
          return Stack(
            children: [
              if (cameraController != null &&
                  cameraController.value.isInitialized)
                Center(
                  child: CameraPreview(cameraController),
                ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.goBackToHome();
                        },
                        child: Container(
                          height: 75,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            color: Color(0XFFFF3589),
                          ),
                          child: Center(
                            child: Text(
                              'Kembali',
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: Container()),
                      InkWell(
                        onTap: () => controller.scanImage(),
                        child: Menu(
                          bgcolor: const Color(0XFFFFAE5F),
                          ico: Lottie.asset(
                            'assets/images/digital_camera.json',
                          ),
                          t1: 'Potret',
                          t2: 'Pindai gambar untuk mengetahui tulisan',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
