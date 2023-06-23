import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PengelolaController extends GetxController {
  RxList<Pengelola> pengelolaList = RxList<Pengelola>([]);
  final CollectionReference pengelolaCollection =
      FirebaseFirestore.instance.collection('pengelola');

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPengelolaData();
  }

  Future<void> fetchPengelolaData() async {
    try {
      isLoading.value = true;
      QuerySnapshot snapshot = await pengelolaCollection.get();
      if (snapshot.docs.isNotEmpty) {
        pengelolaList.value = snapshot.docs
            .map((doc) => Pengelola.fromDocumentSnapshot(doc, doc.id))
            .toList();
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print('Error fetching pengelola data: $e');
    }
  }

  Future<void> deletePengelola(String documentId) async {
    try {
      await pengelolaCollection.doc(documentId).delete();
      print('Pengelola deleted successfully');
      Get.snackbar(
        "",
        "Pengelola Berhasil Dihapus",
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
      fetchPengelolaData();
    } catch (e) {
      print('Error deleting pengelola: $e');
      Get.snackbar(
        "",
        "Pengelola Gagal Dihapus",
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
}

class Pengelola {
  final String documentId;
  late final String uid;
  late final String nama;
  late final String gender;
  late final String profileImg;
  late final String no;
  late final String email;

  Pengelola({
    required this.documentId,
    required this.uid,
    required this.nama,
    required this.gender,
    required this.profileImg,
    required this.no,
    required this.email,
  });

  factory Pengelola.fromDocumentSnapshot(
      DocumentSnapshot doc, String documentId) {
    final data = doc.data() as Map<String, dynamic>;
    return Pengelola(
      documentId: documentId,
      uid: data['uid'],
      nama: data['nama'],
      gender: data['gender'],
      profileImg: data['profileImg'],
      no: data['no'],
      email: data['email'],
    );
  }

  String getInitials() {
    List<String> nameParts = nama.split(' ');
    if (nameParts.length >= 2) {
      return nameParts[0][0].toUpperCase() + nameParts[1][0].toUpperCase();
    } else if (nameParts.length == 1) {
      return nameParts[0][0].toUpperCase();
    } else {
      return '';
    }
  }
}

Future<Pengelola?> getPengelolaData(String? documentId) async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('pengelola')
        .doc(documentId)
        .get();
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      return Pengelola(
        documentId: documentId ?? '',
        uid: data['uid'],
        nama: data['nama'],
        gender: data['gender'],
        profileImg: data['profileImg'],
        no: data['no'],
        email: data['email'],
      );
    } else {
      print('Document does not exist');
    }
  } catch (e) {
    print('Error fetching literature data: $e');
  }
  return null;
}
