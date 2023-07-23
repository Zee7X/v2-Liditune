import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped }

class ResultOcrController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final state = TtsState.stopped.obs;
  final RxBool isGoingBack = false.obs;
  var scannedText = ''.obs;
  Timer? timer;
  int secondsCounter = 0;
  bool isSpeakingLiteracyPrompt = false;

  Future<void> initTts() async {
    await flutterTts.awaitSpeakCompletion(true);
    flutterTts.setStartHandler(() {
      state.value = TtsState.playing;
    });
    flutterTts.setCompletionHandler(() {
      state.value = TtsState.stopped;
    });
    flutterTts.setCancelHandler(() {
      state.value = TtsState.stopped;
    });
    flutterTts.setErrorHandler((message) {
      state.value = TtsState.stopped;
    });
  }

  void setScannedText(String text) {
    scannedText.value = text;
    speakText();
  }

  Future<void> speakText() async {
    await flutterTts.setLanguage("id-ID");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(scannedText.value).then((_) {
      speake(
        "Pembacaan selesai, silahkan klik tombol bawah untuk putar ulang, klik tombol atas untuk kembali mengambil gambar",
      );
    });
    ;
  }

  Future<void> speake(String? text) async {
    if (text != null) {
      await flutterTts.setLanguage("id-ID");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }
  }

  Future<void> stopSpeaking() async {
    final result = await flutterTts.stop();
    if (result == 1) {
      state.value = TtsState.stopped;
    }
  }

  void startSilentTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      secondsCounter++;
      if (secondsCounter >= 300 && !isSpeakingLiteracyPrompt) {
        isSpeakingLiteracyPrompt = true;
        speake('Silahkan lakukan kegiatan literasi');
      }
    });
  }

  void resetSilentTimer() {
    secondsCounter = 0;
    isSpeakingLiteracyPrompt = false;
  }

  void onUserInteraction() {
    resetSilentTimer();
  }

  @override
  void onInit() {
    super.onInit();
    startSilentTimer();
    initTts();
  }

  void goBackToScreen() {
    onUserInteraction();
    isGoingBack.value = true;
    stopSpeaking();
    Get.back();
    speake(
        'Silahkan ambil gambar lain dengan menekan tombol bawah. untuk kembali ke home tekan tombol atas');
  }
}
