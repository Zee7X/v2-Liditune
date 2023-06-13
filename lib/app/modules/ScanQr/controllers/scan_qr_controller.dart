import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

enum TtsState { playing, stopped }

class ScanQrController extends GetxController {
  final FlutterTts _flutterTts = FlutterTts();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final state = TtsState.stopped.obs;
  final Rx<Barcode?> result = Rx<Barcode?>(null);
  late QRViewController qrViewController;
  String convertedText = "";
  final RxBool isGoingBack = false.obs;

  @override
  void onInit() {
    super.onInit();
    initTts();
    speakText(
      'Anda Memasuki Fitur Scan QR, fitur untuk pemindaian QR dengan beberapa data yang sudah ada. Arahkan kamera ke kode QR, tekan atas untuk kembali.',
    );
  }

  void onClose() {
    qrViewController.dispose();
    if (!isGoingBack.value) {
      stopSpeaking();
    }
    super.onClose();
  }

  Future<void> initTts() async {
    await _flutterTts.awaitSpeakCompletion(true);
    _flutterTts.setStartHandler(() {
      state.value = TtsState.playing;
    });
    _flutterTts.setCompletionHandler(() {
      state.value = TtsState.stopped;
    });
    _flutterTts.setCancelHandler(() {
      state.value = TtsState.stopped;
    });
    _flutterTts.setErrorHandler((message) {
      state.value = TtsState.stopped;
    });
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

  void onQRViewCreated(QRViewController controller) {
    qrViewController = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData;
      if (scanData.code != null && scanData.code!.isNotEmpty) {
        convertQrToText(scanData.code!);
      } else {
        handleEmptyQrCode();
      }
    });
  }

  void convertQrToText(String qrCode) {
    convertedText = qrCode.toUpperCase();
    speakText("Code QR berhasil di-scan. Silakan klik tombol bawah bacakan.");
  }

  void playConvertedText() {
    speakText(convertedText);
  }

  void clearScanResult() {
    result.value = null;
    convertedText = '';
  }

  void handleEmptyQrCode() {
    speakText('Code QR Salah Silahkan Ulangi Scan');
  }

  void goBackToHome() {
    isGoingBack.value = true;
    stopSpeaking();
    speakText('Anda kembali ke home. silahkan pilih fitur');
    Get.back();
  }
}
