import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped }

class ResultOcrController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final state = TtsState.stopped.obs;
  final RxBool isGoingBack = false.obs;
  var scannedText = ''.obs;

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

  @override
  void onInit() {
    super.onInit();
    initTts();
  }

  void goBackToScreen() {
    isGoingBack.value = true;
    stopSpeaking();
    Get.back();
    speake(
        'Silahkan ambil gambar lain dengan menekan tombol bawah. untuk kembali ke home tekan tombol atas');
  }
}
