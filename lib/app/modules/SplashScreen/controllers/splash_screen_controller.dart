import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped }

class SplashScreenController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final state = TtsState.stopped.obs;

  Future<void> speakText(String? text) async {
    if (text != null) {
      await flutterTts.setLanguage("id-ID");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }
  }
}
