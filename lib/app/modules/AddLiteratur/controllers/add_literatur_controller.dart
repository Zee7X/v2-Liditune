import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';

import '../../../routes/app_pages.dart';
import '../../LiteraturAdmin/controllers/literatur_admin_controller.dart';

class AddLiteraturController extends GetxController {
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

  Future<void> uploadToFirebase() async {
    if (imageFile.value == null || audioFile.value == null) {
      return;
    }
    String imageName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    String audioName = 'audio_${DateTime.now().millisecondsSinceEpoch}.mp3';
    try {
      uploading.value = true;
      await _storage.ref(imageName).putFile(imageFile.value!);
      String imageUrl = await _storage.ref(imageName).getDownloadURL();
      await _storage.ref(audioName).putFile(audioFile.value!);
      String audioUrl = await _storage.ref(audioName).getDownloadURL();
      await FirebaseFirestore.instance.collection('audioliteratur').add({
        'name': name.value,
        'title': title.value,
        'imageUrl': imageUrl,
        'audioUrl': audioUrl,
      });
      print('Berhasil Upload');
      literaturAdminController.fetchUploadedData();
      Get.back();
      Get.defaultDialog(
        backgroundColor: Color(0Xff252835),
        titleStyle: TextStyle(color: Colors.white),
        middleTextStyle: TextStyle(color: Colors.white),
        title: "Berhasil",
        middleText: "Berhasil Upload Literatur",
        radius: 25.0,
        actions: [
          OutlinedButton(
            onPressed: () {
              isLoading.value = false;
              Get.back();
            },
            child: const Text(
              "Tutup",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    } catch (e) {
      print('Error uploading to Firebase: $e');
      Get.snackbar('Upload Error', 'An error occurred during upload');
    } finally {
      uploading.value = false;
    }
  }

  Future<void> updateLiteratur(String documentId) async {
    if (imageFile.value == null || audioFile.value == null) {
      return;
    }
    String imageName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
    String audioName = 'audio_${DateTime.now().millisecondsSinceEpoch}.mp3';
    try {
      uploading.value = true;
      if (imageFile.value != null) {
        await _storage.ref(imageName).putFile(imageFile.value!);
        String imageUrl = await _storage.ref(imageName).getDownloadURL();
        await FirebaseFirestore.instance
            .collection('audioliteratur')
            .doc(documentId)
            .update({'imageUrl': imageUrl});
      }
      if (audioFile.value != null) {
        await _storage.ref(audioName).putFile(audioFile.value!);
        String audioUrl = await _storage.ref(audioName).getDownloadURL();
        await FirebaseFirestore.instance
            .collection('audioliteratur')
            .doc(documentId)
            .update({'audioUrl': audioUrl});
      }
      await FirebaseFirestore.instance
          .collection('audioliteratur')
          .doc(documentId)
          .update({'name': name.value, 'title': title.value});
      print('Literatur updated successfully');
      Get.toNamed(Routes.LITERATUR_ADMIN);
    } catch (e) {
      print('Error updating literatur: $e');
      Get.snackbar('Update Error', 'An error occurred during update');
    } finally {
      uploading.value = false;
    }
  }
}
