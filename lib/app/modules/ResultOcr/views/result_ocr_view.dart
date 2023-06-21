import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/menu.dart';
import '../controllers/result_ocr_controller.dart';

class ResultOcrView extends GetView<ResultOcrController> {
  const ResultOcrView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00161616),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                controller.goBackToScreen();
              },
              child: Container(
                height: Get.height / 13,
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
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Obx(
                    () => Text(
                      controller.scannedText.value.toUpperCase(),
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                controller.stopSpeaking();
                controller.speakText();
              },
              child: Menu(
                bgcolor: const Color(0XFF8058FB),
                ico: Lottie.asset(
                  'assets/images/mic.json',
                ),
                t1: 'Bacakan',
                t2: '',
              ),
            )
          ],
        ),
      ),
    );
  }
}
