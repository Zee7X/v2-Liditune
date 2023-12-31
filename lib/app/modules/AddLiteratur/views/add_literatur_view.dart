import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Profile/controllers/profile_controller.dart';
import '../controllers/add_literatur_controller.dart';

class AddLiteraturView extends GetView<AddLiteraturController> {
  @override
  Widget build(BuildContext context) {
    Get.put<ProfileController>(ProfileController());
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
                color: Colors.white,
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
                        label: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    controller.imageName.value.isNotEmpty
                                        ? controller.imageName.value
                                        : 'Pilih Gambar Literatur',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF6658FB),
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
                        label: Obx(() => Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Expanded(
                                  child: Text(
                                    controller.audioName.value.isNotEmpty
                                        ? controller.audioName.value
                                        : 'Pilih Audio Literatur',
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF6658FB),
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
                        style: TextStyle(
                          color: Color(0xFF240B74),
                        ),
                        onChanged: (value) {
                          controller.title.value = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.book_outlined,
                            color: Color(0xFF240B74),
                          ),
                          hintText: 'Masukan Judul Literatur',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintStyle: TextStyle(
                            color: Color(0xFF240B74),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF240B74),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF240B74),
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
                        style: TextStyle(
                          color: Color(0xFF240B74),
                        ),
                        onChanged: (value) {
                          controller.name.value = value;
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_3_outlined,
                            color: Color(0xFF240B74),
                          ),
                          hintText: 'Masukan Nama Pengarang',
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintStyle: TextStyle(
                            color: Color(0xFF240B74),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF240B74),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF240B74),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(() => controller.uploading.value
                        ? CircularProgressIndicator()
                        : Container(
                            width: 269,
                            height: 45,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF6658FB), Color(0xFF8C58FB)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
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
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          )),
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
