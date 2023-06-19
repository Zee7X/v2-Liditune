import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_literatur_controller.dart';

class AddLiteraturView extends GetView<AddLiteraturController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: const Color(0xFF240B74),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: const Text(
          'Tambah Literatur',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: Get.width,
              height: Get.height / 2.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(0.8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height / 18,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.pickImage();
                        },
                        icon: Icon(Icons.image),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Pilih Gambar Literatur',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0XFFffdf0a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 50,
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height / 18,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.pickAudio();
                        },
                        icon: Icon(Icons.audio_file),
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              'Pilih Audio Literatur',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0XFFffdf0a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 50,
                    ),
                    Container(
                      height: Get.height / 18,
                      child: TextField(
                        onChanged: (value) {
                          controller.Title.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukan Judul Literatur',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0XFFffdf0a),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0XFFffdf0a),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 50,
                    ),
                    Container(
                      height: Get.height / 18,
                      child: TextField(
                        onChanged: (value) {
                          controller.Name.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukan Nama Pengarang',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0XFFffdf0a),
                              width: 4,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0XFFffdf0a),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Container(
                      width: Get.width / 2,
                      height: Get.height / 18,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.uploadToFirebase();
                        },
                        child: Text(
                          'Upload',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Color(0XFFffdf0a),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
