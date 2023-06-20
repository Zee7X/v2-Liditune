import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class LiteraturAdminController extends GetxController {
  RxList<UploadedLiterature> uploadedLiteratures =
      RxList<UploadedLiterature>([]);

  Stream<List<UploadedLiterature>> get uploadedLiteraturesStream =>
      uploadedLiteratures.stream;

  @override
  void onInit() {
    super.onInit();
    fetchUploadedData();
  }

  Future<void> deleteLiteratur(String documentId) async {
    try {
      await FirebaseFirestore.instance
          .collection('audioliteratur')
          .doc(documentId)
          .delete();
      print('Literatur deleted successfully');
    } catch (e) {
      print('Error deleting literatur: $e');
    }
  }

  Future<void> fetchUploadedData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('audioliteratur').get();
      final literatures = snapshot.docs
          .map((doc) => UploadedLiterature.fromDocumentSnapshot(doc))
          .toList();
      uploadedLiteratures.value = literatures;
    } catch (e) {
      print('Error fetching uploaded data: $e');
    }
  }
}

class UploadedLiterature {
  final String name;
  final String title;
  final String imageUrl;
  final String audioUrl;
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  UploadedLiterature({
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.audioUrl,
  });

  factory UploadedLiterature.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UploadedLiterature(
      name: data['name'],
      title: data['title'],
      imageUrl: data['imageUrl'],
      audioUrl: data['audioUrl'],
    );
  }

  Future<void> playAudio() async {
    try {
      if (isPlaying) {
        await stopAudio();
      }
      await audioPlayer.play(UrlSource(audioUrl));
      isPlaying = true;
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> stopAudio() async {
    try {
      await audioPlayer.stop();
      isPlaying = false;
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }
}
