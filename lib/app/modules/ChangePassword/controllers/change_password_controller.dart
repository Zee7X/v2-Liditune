import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  RxBool isLoading = false.obs;
  var isPasswordHidden = true.obs;
  var isPasswordHidden1 = true.obs;
  var isPasswordHidden2 = true.obs;
  TextEditingController lamaC = TextEditingController();
  TextEditingController baruC = TextEditingController();
  TextEditingController konfirmC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  void updatePass() async {
    if (lamaC.text.isNotEmpty &&
        baruC.text.isNotEmpty &&
        konfirmC.text.isNotEmpty) {
      if (baruC.text == konfirmC.text) {
        isLoading.value = true;
        try {
          String emailUser = auth.currentUser!.email!;

          await auth.signInWithEmailAndPassword(
              email: emailUser, password: lamaC.text);

          await auth.currentUser!.updatePassword(baruC.text);

          Get.back();

          Get.snackbar(
            "",
            "Berhasil Update Password",
            titleText: Text(
              'Berhasil',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
            colorText: Colors.black,
            borderWidth: 1,
            borderColor: Colors.grey.withOpacity(0.2),
          );
        } on FirebaseException catch (e) {
          if (e.code == "wrong-password") {
            Get.snackbar(
              "",
              "Password yang lama/sekarang salah",
              titleText: Text(
                'Terjadi Kesalahan',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.white,
              colorText: Colors.black,
              borderWidth: 1,
              borderColor: Colors.grey.withOpacity(0.2),
            );
          } else {
            Get.snackbar(
                "Terjadi Kesalahan",
                titleText: Text(
                  'Terjadi Kesalahan',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.white,
                colorText: Colors.black,
                borderWidth: 1,
                borderColor: Colors.grey.withOpacity(0.2),
                e.code.toLowerCase());
          }
        } catch (e) {
          Get.snackbar(
            "",
            "Tidak dapat update password",
            titleText: Text(
              'Terjadi Kesalahan',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            colorText: Colors.black,
            borderWidth: 1,
            borderColor: Colors.grey.withOpacity(0.2),
          );
        } finally {
          isLoading.value = false;
        }
      } else {
        Get.snackbar(
          "",
          "Konfirmasi password tidak cocok",
          titleText: Text(
            'Terjadi Kesalahan',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          colorText: Colors.black,
          borderWidth: 1,
          borderColor: Colors.grey.withOpacity(0.2),
        );
      }
    } else {
      Get.snackbar(
        "",
        "isi semua Data!",
        titleText: Text(
          'Terjadi Kesalahan',
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
