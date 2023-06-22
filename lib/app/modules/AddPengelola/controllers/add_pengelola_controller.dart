import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPengelolaController extends GetxController {
  RxBool isLoading = false.obs;
  var isPasswordHidden = true.obs;
  var selected = ''.obs;
  TextEditingController namaC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController noC = TextEditingController();
  TextEditingController genderC = TextEditingController();
  TextEditingController passC = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  setSelected(String value) {
    selected.value = value;
    if (selected.isNotEmpty) {
      genderC.text = selected.toString();
    }
  }

  Future<void> daftarUser() async {
    if (namaC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        noC.text.isNotEmpty &&
        genderC.text.isNotEmpty &&
        passC.text.isNotEmpty) {
      isLoading.value = true;

      try {
        UserCredential userCredential =
            await auth.createUserWithEmailAndPassword(
                email: emailC.text, password: passC.text);

        if (userCredential.user != null) {
          String uid = userCredential.user!.uid;

          await firestore.collection("pengelola").doc(uid).set({
            "uid": uid,
            "nama": namaC.text,
            "no": noC.text,
            "email": emailC.text,
            "gender": genderC.text,
            "profileImg": "",
            "createdAt": DateTime.now().toIso8601String(),
          });

          await userCredential.user!.sendEmailVerification();
          Get.back();

          Get.defaultDialog(
            title: "Berhasil",
            middleText:
                "Berhasil Tambah Pengelola, Cek Email Untuk Verifikasi!",
            backgroundColor: Color(0Xff252835),
            titleStyle: TextStyle(color: Colors.white),
            middleTextStyle: TextStyle(color: Colors.white),
            radius: 25.0,
            actions: [
              OutlinedButton(
                onPressed: () {
                  isLoading.value = false;
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  "Tutup",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        }
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        isLoading.value = false;
        if (e.code == 'weak-password') {
          Get.snackbar(
            '',
            'Password yang digunakan sangat pendek.',
            titleText: const Text(
              'Peringatan',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            colorText: Colors.black,
            borderWidth: 1,
            borderColor: Colors.grey.withOpacity(0.2),
          );
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar(
            '',
            'Email ini sudah terdaftar sebelumnya.',
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
      } catch (e) {
        isLoading.value = false;
        Get.snackbar(
          '',
          'Gagal mendaftar.',
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
    } else {
      Get.snackbar(
        "",
        "Isi semua data diri Anda!",
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
