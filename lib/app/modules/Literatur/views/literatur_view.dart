import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../utils/menu.dart';
import '../controllers/literatur_controller.dart';

class LiteraturView extends GetView<LiteraturController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0x00161616),
      body: Stack(
        children: [
          Center(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      controller.goBackToHome();
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
                  const SizedBox(height: 16),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Column(
                          children: [
                            Obx(() {
                              final currentLiterature =
                                  controller.uploadedLiteratures.isNotEmpty
                                      ? controller.uploadedLiteratures[
                                          controller.currentIndex.value]
                                      : UploadedLiterature.empty();
                              return Visibility(
                                visible: !controller.isLoading.value,
                                child: Text(
                                  currentLiterature.title,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                replacement: CircularProgressIndicator(),
                              );
                            }),
                            const SizedBox(height: 10),
                            Obx(() {
                              final currentLiterature =
                                  controller.uploadedLiteratures.isNotEmpty
                                      ? controller.uploadedLiteratures[
                                          controller.currentIndex.value]
                                      : UploadedLiterature.empty();
                              return Visibility(
                                visible: !controller.isLoading.value,
                                child: Text(
                                  currentLiterature.name,
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                replacement: CircularProgressIndicator(),
                              );
                            }),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.playPreviousLiterature();
                              controller.onUserInteraction();
                            },
                            child: Container(
                              height: Get.height / 2.7,
                              width: Get.width / 7,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                color: Color(0XFF8058FB),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Obx(() {
                            final currentLiterature =
                                controller.uploadedLiteratures.isNotEmpty
                                    ? controller.uploadedLiteratures[
                                        controller.currentIndex.value]
                                    : UploadedLiterature.empty();
                            final imageUrl = currentLiterature.imageUrl;
                            final imageProvider = imageUrl.startsWith('http')
                                ? NetworkImage(imageUrl)
                                : imageUrl.startsWith('https')
                                    ? NetworkImage(imageUrl)
                                    : imageUrl.startsWith('assets')
                                        ? AssetImage(imageUrl)
                                        : FileImage(File(imageUrl))
                                            as ImageProvider<Object>;
                            return Visibility(
                              visible: !controller.isLoading.value,
                              child: Container(
                                width: Get.width / 1.5,
                                height: Get.height / 2.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              replacement: CircularProgressIndicator(),
                            );
                          }),
                          InkWell(
                            onTap: () {
                              controller.playNextLiterature();
                              controller.onUserInteraction();
                            },
                            child: Container(
                              height: Get.height / 2.7,
                              width: Get.width / 7,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                                color: Color(0XFF8058FB),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.currentPlayingLiterature.isPlaying) {
                        controller.pauseLiteratureAudio();
                        controller.onUserInteraction();
                      } else {
                        final currentLiterature =
                            controller.uploadedLiteratures.isNotEmpty
                                ? controller.uploadedLiteratures[
                                    controller.currentIndex.value]
                                : null;
                        if (currentLiterature != null) {
                          controller.playLiteratureAudio(currentLiterature);
                          controller.stopSpeaking();
                          controller.onUserInteraction();
                        }
                      }
                    },
                    child: Menu(
                      bgcolor: const Color(0XFFFF3589),
                      ico: Lottie.asset(
                        'assets/images/book.json',
                      ),
                      t1: 'Putar',
                      t2: 'Fitur untuk melakukan kegiatan Literasi dengan buku yang tersedia',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
