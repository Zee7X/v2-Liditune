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
                            border: Border.all(color: Color(0xFF240B74)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.image,
                                  color: Color(0xFF240B74),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    controller.imageName.value.isNotEmpty
                                        ? controller.imageName.value
                                        : literature.imageUrl,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      color: Color(0xFF240B74),
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
                            border: Border.all(color: Color(0xFF240B74)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.audio_file,
                                  color: Color(0xFF240B74),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    controller.audioName.value.isNotEmpty
                                        ? controller.audioName.value
                                        : literature.audioUrl,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 14,
                                      color: Color(0xFF240B74),
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
                          hintText: controller.title.value.isEmpty
                              ? literature.title
                              : 'Masukan Judul Literatur',
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
                        style: TextStyle(
                          color: Color(0xFF240B74),
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person_3_outlined,
                            color: Color(0xFF240B74),
                          ),
                          hintText: controller.name.value.isEmpty
                              ? literature.name
                              : 'Masukan Nama Pengarang',
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
                        controller:
                            TextEditingController(text: literature.name),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Obx(
                      () => controller.uploading.value
                          ? CircularProgressIndicator()
                          : Container(
                              width: 269,
                              height: 45,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFF6658FB),
                                    Color(0xFF8C58FB)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                                  backgroundColor: Colors.transparent,
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
