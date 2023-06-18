import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../ResultOcr/controllers/result_ocr_controller.dart';
import '../../ResultOcr/views/result_ocr_view.dart';

enum TtsState { playing, stopped }

class ScanOcrController extends GetxController with WidgetsBindingObserver {
  final FlutterTts _flutterTts = FlutterTts();
  late final Future<void> future;
  bool isPermissionGranted = false;
  final state = TtsState.stopped.obs;
  final Rx<CameraController?> cameraController = Rx<CameraController?>(null);
  final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
  final RxBool isGoingBack = false.obs;
  final ResultOcrController resultOcrController =
      Get.put(ResultOcrController());

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    speakText(
      'Anda Memasuki Fitur Bacakan. Fitur ini melakukan pemindaian sebuah tulisan dengan cara mengambil gambar. Tekan atas untuk kembali, tekan bawah untuk mengambil gambar.',
    );
    requestCameraPermission();
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    stopCamera();
    textRecognizer.close();
    if (!isGoingBack.value) {
      stopSpeaking();
    }
    super.onClose();
  }

  Future<void> requestCameraPermission() async {
    final status = await Permission.camera.request();
    isPermissionGranted = status.isGranted;
    if (isPermissionGranted) {
      startCamera();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController.value == null ||
        !cameraController.value!.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      stopCamera();
    } else if (state == AppLifecycleState.resumed &&
        cameraController.value != null &&
        cameraController.value!.value.isInitialized) {
      startCamera();
    }
  }

  void startCamera() async {
    final cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      initCameraController(cameras);
    }
  }

  void stopCamera() {
    cameraController.value?.dispose();
    cameraController.value = null;
  }

  void initCameraController(List<CameraDescription> cameras) {
    if (cameraController.value != null) {
      return;
    }
    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++) {
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }
    if (camera != null) {
      cameraSelected(camera);
    }
  }

  Future<void> speakText(String? text) async {
    if (text != null) {
      await _flutterTts.setLanguage("id-ID");
      await _flutterTts.setPitch(1.0);
      await _flutterTts.speak(text);
    }
  }

  Future<void> stopSpeaking() async {
    final result = await _flutterTts.stop();
    if (result == 1) {
      state.value = TtsState.stopped;
    }
  }

  void cameraSelected(CameraDescription camera) async {
    cameraController.value = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: true,
    );
    await cameraController.value?.initialize();
    if (cameraController.value?.value.isInitialized == true) {
      update();
    } else {
      print('Camera initialization failed.');
    }
  }

  void scanImage() async {
    if (cameraController.value?.value.isInitialized != true) return;
    try {
      final pictureFile = await cameraController.value?.takePicture();
      final file = File(pictureFile!.path);
      final inputImage = InputImage.fromFilePath(file.path);
      final recognisedText = await textRecognizer.processImage(inputImage);
      print('Teks Terdeteksi: ${recognisedText.text}');
      stopSpeaking();
      speakText('Scan Berhasil. Silahkan Tekan Tombol Bawah Bacakan.');
      resultOcrController.setScannedText(recognisedText.text);
      await Get.to(() => ResultOcrView());
    } catch (e) {
      speakText('Pengambilan Gambar Gagal. Silahkan Ulangi.');
    }
  }

  void goBackToHome() {
    isGoingBack.value = true;
    stopSpeaking();
    Get.back();
    speakText('Anda kembali ke home. silahkan pilih fitur');
  }
}
