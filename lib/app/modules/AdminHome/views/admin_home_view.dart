import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:literasi_digital_tuna_netra/app/routes/app_pages.dart';

import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app_outlined),
          onPressed: () {
            controller.logout();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              Get.toNamed(Routes.EDIT_PROFILE);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: Get.height / 3.44,
                decoration: BoxDecoration(
                  color: Color(0XFF3675EE),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: Get.height / 25,
                        left: Get.width / 10.5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            "Explore",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 1.0),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              minimumSize: Size(110, 34),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.ABOUT_US);
                            },
                            child: Text(
                              "About Us",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 3),
                    Image.asset(
                      'assets/images/saly.png',
                      width: Get.width / 1.8,
                      height: Get.height / 3.14,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 22.0,
                left: 24,
                bottom: 11,
              ),
              child: Text(
                "Manage Feature",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: Get.width / 1.10,
                height: Get.height / 5.22,
                decoration: BoxDecoration(
                  color: Color(0Xff252835),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/notebook.png',
                      width: Get.width / 3.8,
                      height: Get.height / 8.5,
                    ),
                    Text(
                      "Jumlah\nBuku",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(width: 70),
                    Text(
                      "12",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: Color(0XFF876EFE),
                          fontSize: 64,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PENGELOLA);
                    },
                    child: Container(
                      width: Get.width / 2.3,
                      height: Get.height / 4.7,
                      decoration: BoxDecoration(
                        color: Color(0Xff252835),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/images/salto.png',
                              width: Get.width / 3.75,
                              height: Get.height / 8.3,
                            ),
                          ),
                          Text(
                            "Pengelola",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            "Setting of user database",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0XFF787583),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LITERATUR_ADMIN);
                    },
                    child: Container(
                      width: Get.width / 2.3,
                      height: Get.height / 4.7,
                      decoration: BoxDecoration(
                        color: Color(0Xff252835),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.asset(
                              'assets/images/notebook.png',
                              width: Get.width / 3.75,
                              height: Get.height / 8.3,
                            ),
                          ),
                          Text(
                            "Literatur",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Text(
                            "Setting of literature sources",
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0XFF787583),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
