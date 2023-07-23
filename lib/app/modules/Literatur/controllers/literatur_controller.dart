import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

enum TtsState { playing, stopped }

class LiteraturController extends GetxController {
  RxList<UploadedLiterature> uploadedLiteratures = <UploadedLiterature>[].obs;
  RxInt currentIndex = 0.obs;
  final AudioPlayer audioPlayer = AudioPlayer();
  UploadedLiterature currentPlayingLiterature = UploadedLiterature.empty();
  final state = TtsState.stopped.obs;
  final FlutterTts flutterTts = FlutterTts();
  final RxBool isGoingBack = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUploadedData().then((_) {
      if (uploadedLiteratures.isNotEmpty) {
        currentIndex.value = 0;
        speakText(
            'Anda Memasuki Fitur Literatur, Fitur untuk melakukan kegiatan literasi dengan buku yang tersedia. tekan bawah untuk putar, tekan samping kiri untuk sebelumnya dan tekan samping kanan untuk berikutnya, tekan atas untuk kembali. Judul literatur saat ini ${uploadedLiteratures[currentIndex.value].title}, Karangan ${uploadedLiteratures[currentIndex.value].name}. Klik Tombol Bawah Untuk Putar');
      }
    });
  }

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

  Future<void> speakText(String? text) async {
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

  void goBackToHome() {
    isGoingBack.value = true;
    stopSpeaking();
    onBackPressed();
    Get.back();
    speakText('Anda kembali ke home. silahkan pilih fitur');
  }

  Future<bool> onBackPressed() async {
    try {
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.stop();
        return false;
      }
    } catch (e) {
      print('Error stopping audio: $e');
    }
    return true;
  }

  Future<void> fetchUploadedData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('literatur').get();
      final literatures = snapshot.docs
          .map((doc) => UploadedLiterature.fromDocumentSnapshot(doc, doc.id))
          .toList();
      uploadedLiteratures.assignAll(literatures);
    } catch (e) {
      print('Error fetching uploaded data: $e');
    }
  }

  void playLiteratureAudio(UploadedLiterature literature) async {
    try {
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.stop();
      }
      await audioPlayer.play(UrlSource(literature.audioUrl));
      literature.isPlaying = true;
      currentPlayingLiterature = literature;
      currentIndex = uploadedLiteratures.indexOf(literature) as RxInt;
      update();
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> stopLiteratureAudio() async {
    try {
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.stop();
        currentPlayingLiterature.isPlaying = false;
        currentPlayingLiterature = UploadedLiterature.empty();
        update();
      }
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }

  void pauseLiteratureAudio() async {
    try {
      if (audioPlayer.state == PlayerState.playing) {
        await audioPlayer.pause();
        currentPlayingLiterature.isPlaying = false;
        update();
      }
    } catch (e) {
      print('Error pausing audio: $e');
    }
  }

  void resumeLiteratureAudio() async {
    try {
      if (audioPlayer.state == PlayerState.paused) {
        await audioPlayer.resume();
        currentPlayingLiterature.isPlaying = true;
        update();
      }
    } catch (e) {
      print('Error resuming audio: $e');
    }
  }

  void playNextLiterature() {
    if (currentIndex < uploadedLiteratures.length - 1) {
      stopLiteratureAudio();
      stopSpeaking();
      currentIndex++;
    } else {
      currentIndex.value = 0;
    }
    final nextLiterature = uploadedLiteratures[currentIndex.value];
    speakText(
        'Literatur selanjutnya. Dengan Judul ${nextLiterature.title}, Karangan ${nextLiterature.name}. Klik tombol Bawah Untuk Putar');
  }

  void playPreviousLiterature() {
    stopLiteratureAudio();
    stopSpeaking();
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex.value = uploadedLiteratures.length - 1;
    }

    final previousLiterature = uploadedLiteratures[currentIndex.value];
    speakText(
        'Literatur sebelumnya. Dengan Judul: ${previousLiterature.title}, Karangan ${previousLiterature.name}. Klik tombol Bawah Untuk Putar');
  }
}

class UploadedLiterature {
  final String documentId;
  final String name;
  final String title;
  final String imageUrl;
  final String audioUrl;
  bool isPlaying;

  UploadedLiterature({
    required this.documentId,
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.audioUrl,
    this.isPlaying = false,
  });

  UploadedLiterature.empty()
      : documentId = '',
        name = '',
        title = '',
        imageUrl = '',
        audioUrl = '',
        isPlaying = false;

  factory UploadedLiterature.fromDocumentSnapshot(
      DocumentSnapshot doc, String documentId) {
    final data = doc.data() as Map<String, dynamic>;
    return UploadedLiterature(
      documentId: documentId,
      name: data['name'],
      title: data['title'],
      imageUrl: data['imageUrl'],
      audioUrl: data['audioUrl'],
    );
  }
}
