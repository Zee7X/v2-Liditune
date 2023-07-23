import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class LiteraturAdminController extends GetxController {
  RxList<UploadedLiterature> uploadedLiteratures =
      RxList<UploadedLiterature>([]);
  Stream<List<UploadedLiterature>> get uploadedLiteraturesStream =>
      uploadedLiteratures.stream;
  final AudioPlayer audioPlayer = AudioPlayer();
  Rx<UploadedLiterature?> currentPlayingLiterature =
      Rx<UploadedLiterature?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchUploadedData();
  }

  Future<bool> onBackPressed() async {
    if (currentPlayingLiterature.value?.isPlaying.value == true) {
      currentPlayingLiterature.value?.stopAudio();
      return false;
    }
    return true;
  }

  Future<void> deleteLiteratur(String documentId) async {
    try {
      final confirmed = await Get.dialog<bool>(
        AlertDialog(
          backgroundColor: Color(0Xff252835),
          title: Text(
            'Konfirmasi Hapus',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Yakin Ingin Menghapus Literatur?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Get.back(result: false);
              },
            ),
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Get.back(result: true);
              },
            ),
          ],
        ),
      );

      if (confirmed == true) {
        await FirebaseFirestore.instance
            .collection('literatur')
            .doc(documentId)
            .delete();
        print('Literatur deleted successfully');
        Get.snackbar(
          "",
          "Literatur Berhasil Dihapus",
          titleText: const Text(
            'Berhasil',
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0Xff252835),
          colorText: Colors.white,
          borderWidth: 1,
          borderColor: Colors.grey.withOpacity(0.2),
        );
        fetchUploadedData();
      } else {
        print('Deletion canceled');
      }
    } catch (e) {
      print('Error deleting literatur: $e');
      Get.snackbar(
        "",
        "Literatur Gagal Dihapus",
        titleText: const Text(
          'Gagal',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        colorText: Colors.black,
        borderWidth: 1,
        borderColor: Colors.grey.withOpacity(0.2),
      );
    }
  }

  Future<void> fetchUploadedData() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('literatur').get();
      final literatures = snapshot.docs
          .map((doc) => UploadedLiterature.fromDocumentSnapshot(doc, doc.id))
          .toList();
      uploadedLiteratures.value = literatures;
    } catch (e) {
      print('Error fetching uploaded data: $e');
    }
  }

  void playLiteratureAudio(UploadedLiterature literature) {
    if (currentPlayingLiterature.value?.isPlaying.value == true) {
      currentPlayingLiterature.value?.stopAudio();
    }
    literature.playAudio();
    currentPlayingLiterature.value = literature;
    uploadedLiteratures.forEach((item) {
      item.isPlaying = (item == literature) as RxBool;
    });
  }
}

class UploadedLiterature {
  final String documentId;
  late final String name;
  late final String title;
  late final String imageUrl;
  late final String audioUrl;
  late final String? addedBy;
  final AudioPlayer audioPlayer = AudioPlayer();
  RxBool isPlaying = RxBool(false);

  UploadedLiterature({
    required this.documentId,
    required this.name,
    required this.title,
    required this.imageUrl,
    required this.audioUrl,
    required this.addedBy,
  });

  UploadedLiterature.empty()
      : documentId = '',
        name = '',
        title = '',
        imageUrl = '',
        audioUrl = '';

  factory UploadedLiterature.fromDocumentSnapshot(
      DocumentSnapshot doc, String documentId) {
    final data = doc.data() as Map<String, dynamic>;
    return UploadedLiterature(
      documentId: documentId,
      name: data['name'],
      title: data['title'],
      imageUrl: data['imageUrl'],
      audioUrl: data['audioUrl'],
      addedBy: data['addedBy'],
    );
  }

  Future<void> playAudio() async {
    try {
      await audioPlayer.play(UrlSource(audioUrl));
      isPlaying.value = true;
    } catch (e) {
      print('Error playing audio: $e');
    }
  }

  Future<void> stopAudio() async {
    try {
      await audioPlayer.stop();
      isPlaying.value = false;
    } catch (e) {
      print('Error stopping audio: $e');
    }
  }
}

Future<UploadedLiterature?> getLiteratureData(String? documentId) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('literatur')
        .doc(documentId)
        .get();
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      return UploadedLiterature(
        documentId: documentId ?? '',
        name: data['name'],
        title: data['title'],
        imageUrl: data['imageUrl'],
        audioUrl: data['audioUrl'],
        addedBy: data['addedBy'],
      );
    } else {
      print('Document does not exist');
    }
  } catch (e) {
    print('Error fetching literature data: $e');
  }
  return null;
}
