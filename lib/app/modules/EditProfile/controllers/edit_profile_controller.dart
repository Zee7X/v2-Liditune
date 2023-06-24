import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../Pengelola/controllers/pengelola_controller.dart';

class EditProfileController extends GetxController {
  final PengelolaController pengelolaController =
      Get.find<PengelolaController>();

  RxString nama = RxString('');
  RxString gender = RxString('');
  RxString no = RxString('');
  var selected = RxString('');

  @override
  void onInit() {
    super.onInit();
    final pengelola = Get.arguments as Pengelola;
    nama.value = pengelola.nama;
    gender.value = pengelola.gender;
    no.value = pengelola.no;
  }

  setSelected(String value) {
    selected.value = value;
    if (selected.isNotEmpty) {
      gender.value = selected.value;
    }
  }

  Future<void> updateProfile(String documentId) async {
    if (nama.value.isEmpty || gender.value.isEmpty || no.value.isEmpty) {
      Get.snackbar(
        "Peringatan",
        "Harap isi semua field",
        titleText: const Text(
          'Peringatan',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0Xff252835),
        colorText: Colors.white,
        borderWidth: 1,
        borderColor: Colors.grey.withOpacity(0.2),
      );
      return;
    }

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        final Map<String, dynamic> updateData = {
          'nama': nama.value,
          'gender': gender.value,
          'no': no.value,
        };
        await FirebaseFirestore.instance
            .collection('pengelola')
            .doc(documentId)
            .update(updateData);

        pengelolaController.fetchPengelolaData();
        Get.back();
        Get.snackbar(
          "",
          "Profil berhasil diperbarui",
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
      } catch (e) {
        print('Error updating profile: $e');
        Get.snackbar(
          "",
          "Gagal memperbarui profil",
          titleText: const Text(
            'Gagal',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0Xff252835),
          colorText: Colors.white,
          borderWidth: 1,
          borderColor: Colors.grey.withOpacity(0.2),
        );
      }
    } else {
      Get.snackbar(
        "",
        "Gagal memperbarui profil. Pengguna tidak ditemukan.",
        titleText: const Text(
          'Gagal',
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0Xff252835),
        colorText: Colors.white,
        borderWidth: 1,
        borderColor: Colors.grey.withOpacity(0.2),
      );
    }
  }
}
