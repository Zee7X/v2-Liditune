import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../LiteraturAdmin/controllers/literatur_admin_controller.dart';

class EditLiteraturController extends GetxController {
  final LiteraturAdminController literaturAdminController =
      Get.find<LiteraturAdminController>();
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  Rx<File?> imageFile = Rx<File?>(null);
  Rx<File?> audioFile = Rx<File?>(null);
  RxString imageName = RxString('');
  RxString audioName = RxString('');
  RxString title = RxString('');
  RxString name = RxString('');
  RxBool uploading = RxBool(false);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final literature = Get.arguments as UploadedLiterature;
    title.value = literature.title;
    name.value = literature.name;
  }

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      imageFile.value = File(result.files.single.path!);
      imageName.value = result.files.single.name;
    }
  }

  Future<void> pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null) {
      audioFile.value = File(result.files.single.path!);
      audioName.value = result.files.single.name;
    }
  }

  Future<void> updateLiterature() async {
    if (name.value.isEmpty || title.value.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Nama dan Judul tidak boleh kosong",
        titleText: const Text(
          'Peringatan',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0Xff252835),
        colorText: Colors.white,
        borderWidth: 1,
        borderColor: Colors.grey.withOpacity(0.2),
      );
      return;
    }

    String imageUrl = '';
    String audioUrl = '';

    if (imageFile.value != null) {
      String imageName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      try {
        uploading.value = true;
        await _storage.ref(imageName).putFile(imageFile.value!);
        imageUrl = await _storage.ref(imageName).getDownloadURL();
      } catch (e) {
        print('Error uploading image to Firebase Storage: $e');
        Get.snackbar('Upload Error', 'An error occurred during image upload');
        return;
      }
    }

    if (audioFile.value != null) {
      String audioName = 'audio_${DateTime.now().millisecondsSinceEpoch}.mp3';
      try {
        uploading.value = true;
        await _storage.ref(audioName).putFile(audioFile.value!);
        audioUrl = await _storage.ref(audioName).getDownloadURL();
      } catch (e) {
        print('Error uploading audio to Firebase Storage: $e');
        Get.snackbar('Upload Error', 'An error occurred during audio upload');
        return;
      }
    }

    UploadedLiterature? literature;

    try {
      literature = Get.arguments as UploadedLiterature;
      await FirebaseFirestore.instance
          .collection('literatur')
          .doc(literature.documentId)
          .update({
        'name': name.value,
        'title': title.value,
        if (imageUrl.isNotEmpty) 'imageUrl': imageUrl,
        if (audioUrl.isNotEmpty) 'audioUrl': audioUrl,
      });

      literaturAdminController.fetchUploadedData();
      Get.back();
      Get.defaultDialog(
        backgroundColor: Color(0Xff252835),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        title: "Berhasil",
        middleText: "Berhasil Update Literatur",
        radius: 25.0,
        actions: [
          OutlinedButton(
            onPressed: () {
              isLoading.value = false;
              Get.back();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            child: const Text(
              "Tutup",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      );
    } catch (e) {
      print('Error updating to Firebase: $e');
      Get.snackbar('Update Error', 'An error occurred during update');
    } finally {
      uploading.value = false;
    }
  }
}
