import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  RxBool isLoading = false.obs;
  RxString isNotifikasi = ''.obs;
  TextEditingController emailC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  // void resetFields() {
  //   emailC.clear();
  // }

  Future<void> sendEmail() async {
    if (emailC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        await auth.sendPasswordResetEmail(email: emailC.text);
        isNotifikasi.value = "Terkirim! Silahkan cek email anda";
      } catch (e) {
        isNotifikasi.value = "Email tidak ada! Silahkan cek kembali";
        // Get.snackbar("title", "message");
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        "Peringatan",
        "Email harus di isi",
        titleText: const Text(
          'Peringatan',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        colorText: Colors.black,
        borderWidth: 1,
        borderColor: Colors.grey.withOpacity(0.2),
      );
    }
  }
}
