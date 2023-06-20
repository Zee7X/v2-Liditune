import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  var isPasswordHidden = true.obs;

  // Login manually
  RxBool isLoading = false.obs;
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login() async {
    if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
            email: emailC.text, password: passC.text);

        if (userCredential.user != null) {
          if (userCredential.user!.emailVerified == true) {
            isLoading.value = false;
            Get.toNamed(Routes.ADMIN_HOME);
          } else {
            Get.defaultDialog(
              title: "Informasi",
              middleText:
                  "Akun Kamu belum diverifikasi. Klik link verifikasi pada pesann email di email yang kamu daftarkan yah!",
              actions: [
                OutlinedButton(
                  onPressed: () {
                    isLoading.value = false;
                    Get.back();
                  },
                  child: const Text("CANCEL"),
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      Get.back();
                      Get.snackbar(
                        "",
                        "Email Verifikasi Telah Dikirim!",
                        titleText: const Text(
                          'Berhasil',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0Xff252835),
                        colorText: Colors.black,
                        borderWidth: 1,
                        borderColor: Colors.grey.withOpacity(0.2),
                      );
                      isLoading.value = false;
                    } catch (e) {
                      isLoading.value = false;
                      Get.snackbar(
                        "",
                        "Tidak dapat mengirim email verifikasi",
                        titleText: const Text(
                          'Terjadi Kesalahan',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Color(0Xff252835),
                        colorText: Colors.white,
                        borderWidth: 1,
                        borderColor: Colors.grey.withOpacity(0.2),
                      );
                    }
                  },
                  child: const Text("KIRIM ULANG"),
                ),
              ],
            );
          }
          isLoading.value = false;
        }
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;

        if (e.code == 'user-not-found') {
          Get.snackbar(
            "",
            "Email tidak terdaftar!",
            titleText: const Text(
              'Terjadi Kesalahan',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color(0Xff252835),
            colorText: Colors.white,
            borderWidth: 1,
            borderColor: Colors.grey.withOpacity(0.2),
          );
        } else if (e.code == 'wrong-password') {
          Get.snackbar(
            "",
            "Password salah!",
            titleText: const Text(
              'Terjadi Kesalahan',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Color(0Xff252835),
            colorText: Colors.white,
            borderWidth: 1,
            borderColor: Colors.grey.withOpacity(0.2),
          );
        }
      } catch (e) {
        isLoading.value = false;
        Get.snackbar(
          "",
          "Tidak dapat Login!",
          titleText: const Text(
            'Terjadi Kesalahan',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
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
        "Email dan Password wajib di isi!",
        titleText: const Text(
          'Terjadi Kesalahan',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0Xff252835),
        colorText: Colors.white,
        borderWidth: 1,
        borderColor: Colors.grey.withOpacity(0.2),
      );
    }
  }

  void resetFields() {
    emailC.clear();
    passC.clear();
  }
}
