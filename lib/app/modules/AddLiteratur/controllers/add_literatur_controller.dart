import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:file_picker/file_picker.dart';

class AddLiteraturController extends GetxController {
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  Rx<File?> imageFile = Rx<File?>(null);
  Rx<File?> audioFile = Rx<File?>(null);
  RxString Name = RxString('');
  RxString Title = RxString('');

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null) {
      imageFile.value = File(result.files.single.path!);
    }
  }

  Future<void> pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
    );
    if (result != null) {
      audioFile.value = File(result.files.single.path!);
      
    }
  }

  Future<void> uploadToFirebase() async {
    if (imageFile.value == null || audioFile.value == null) {
      return;
    }
    String imageName = 'image.jpg';
    String audioName = 'audio.mp3';
    try {
      await _storage.ref(imageName).putFile(imageFile.value!);
      String imageUrl = await _storage.ref(imageName).getDownloadURL();
      await _storage.ref(audioName).putFile(audioFile.value!);
      String audioUrl = await _storage.ref(audioName).getDownloadURL();
      await FirebaseFirestore.instance.collection('audioliteratur').add({
        'name': Name.value,
        'title': Title.value,
        'imageUrl': imageUrl,
        'audioUrl': audioUrl,
      });
    } catch (e) {
      print('Error uploading to Firebase: $e');
    }
  }
}
