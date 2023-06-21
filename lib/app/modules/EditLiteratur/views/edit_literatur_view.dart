import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../LiteraturAdmin/controllers/literatur_admin_controller.dart';
import '../controllers/edit_literatur_controller.dart';

class EditLiteraturView extends GetView<EditLiteraturController> {
  @override
  Widget build(BuildContext context) {
    final UploadedLiterature literature = Get.arguments as UploadedLiterature;

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
          'Edit Literatur',
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
                    Obx(
                      () => InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Container(
                          width: Get.width,
                          height: Get.height / 18,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.image),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    controller.imageName.value.isNotEmpty
                                        ? controller.imageName.value
                                        : literature.imageUrl,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height / 50),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          controller.pickAudio();
                        },
                        child: Container(
                          width: Get.width,
                          height: Get.height / 18,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(Icons.audio_file),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    controller.audioName.value.isNotEmpty
                                        ? controller.audioName.value
                                        : literature.audioUrl,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height / 50),
                    Container(
                      height: Get.height / 18,
                      child: TextField(
                        onChanged: (value) {
                          controller.title.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: controller.title.value.isEmpty
                              ? literature.title
                              : null,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF240B74),
                              width: 2,
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
                        controller:
                            TextEditingController(text: literature.title),
                      ),
                    ),
                    SizedBox(height: Get.height / 50),
                    Container(
                      height: Get.height / 18,
                      child: TextField(
                        onChanged: (value) {
                          controller.name.value = value;
                        },
                        decoration: InputDecoration(
                          hintText: controller.name.value.isEmpty
                              ? literature.name
                              : null,
                          contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Color(0xFF240B74),
                              width: 4,
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
                        controller:
                            TextEditingController(text: literature.name),
                      ),
                    ),
                    SizedBox(height: Get.height / 20),
                    Obx(
                      () => controller.uploading.value
                          ? CircularProgressIndicator()
                          : Container(
                              width: Get.width / 2,
                              height: Get.height / 18,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.updateLiterature();
                                },
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Color(0xFF240B74),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                    ),
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
