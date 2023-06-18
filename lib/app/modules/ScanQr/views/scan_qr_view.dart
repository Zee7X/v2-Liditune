import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:lottie/lottie.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../utils/menu.dart';
import '../controllers/scan_qr_controller.dart';

class ScanQrView extends GetView<ScanQrController> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                controller.clearScanResult();
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
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: controller.onQRViewCreated,
              ),
            ),
            Obx(
              () => InkWell(
                onTap: controller.playConvertedText,
                child: Menu(
                  bgcolor: const Color(0XFF8058FB),
                  ico: Lottie.asset(
                    'assets/images/mic.json',
                  ),
                  t1: controller.state.value == TtsState.playing
                      ? 'Berhenti'
                      : 'Bacakan',
                  t2: '',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
