import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped }

class HomeController extends GetxController {
  final FlutterTts flutterTts = FlutterTts();
  final state = TtsState.stopped.obs;

  Future<void> speakText() async {
    {
      await flutterTts.setLanguage("id-ID");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(
          'Selamat Datang Di Home, Tekan Atas Untuk Fitur Pertama Literatur, Tekan Tengah Fitur Kedua Scan QR, Tekan Bawah Fitur Ketiga Bacakan');
    }
  }

  Future<void> voidPress() async {
    {
      await flutterTts.setLanguage("id-ID");
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(
        'Anda Tidak menekan fitur apapun, silahkan pilih fitur',
      );
    }
  }

  Future<void> stopSpeaking() async {
    final result = await flutterTts.stop();
    if (result == 1) {
      state.value = TtsState.stopped;
    }
  }
}