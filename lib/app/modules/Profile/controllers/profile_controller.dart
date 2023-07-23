import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ImagePicker picker = ImagePicker();
  RxBool isLoading = false.obs;
  Rx<User?> currentUser = Rx<User?>(null);
  Rx<Map<String, dynamic>?> userProfile = Rx<Map<String, dynamic>?>(null);
  Map<String, Rx<Map<String, dynamic>?>> userProfiles = {};
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  String profileImageUrl = '';
  var selected = ''.obs;
  RxString userName = RxString('');

  String getImagePlaceholder(String name) {
    if (name.isEmpty) return '';
    List<String> names = name.split(' ');
    String initials = '';
    int maxInitials = 2;
    int count = 0;
    for (String n in names) {
      if (n.isNotEmpty) {
        initials += n[0].toUpperCase();
        count++;
        if (count == maxInitials) break;
      }
    }
    return initials;
  }

  setSelected(String value) {
    selected.value = value;
    if (selected.isNotEmpty) {
      genderController.text = selected.toString();
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    try {
      isLoading.value = true;
      User? user = _auth.currentUser;

      if (user != null) {
        currentUser.value = user;

        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await _firestore.collection("pengelola").doc(user.uid).get();

        if (snapshot.exists) {
          Map<String, dynamic>? newProfile = snapshot.data();
          if (newProfile != null && newProfile['email'] == user.email) {
            if (newProfile != userProfile.value) {
              userProfile.value = newProfile;
              nameController.text = userProfile.value!['nama'];
              userName.value = userProfile.value!['nama'];
              emailController.text = userProfile.value!['email'];
              phoneController.text = userProfile.value!['no'];
              genderController.text = userProfile.value!['gender'];
              profileImageUrl = userProfile.value!['profileImg'];
            }
          }
        }
      }
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateUserProfile() async {
    try {
      isLoading.value = true;
      User? user = _auth.currentUser;

      if (user != null) {
        if (_validateInputs()) {
          String imageUrl = userProfile.value?['profileImg'] ?? '';

          if (profileImageUrl.isNotEmpty && profileImageUrl != imageUrl) {
            final file = File(profileImageUrl);
            imageUrl = await _uploadProfileImage(file, user.uid);
          }

          await _firestore.collection("pengelola").doc(user.uid).update({
            "nama": nameController.text,
            "email": emailController.text,
            "no": phoneController.text,
            "gender": genderController.text,
            "profileImg": imageUrl,
          });

          if (user.email != emailController.text) {
            await user.updateEmail(emailController.text);
            await user.sendEmailVerification();
            Get.defaultDialog(
              title: "Informasi",
              middleText: "Berhasil Ubah Email, Cek Email Untuk Verifikasi!",
              backgroundColor: Color(0Xff252835),
              titleStyle: TextStyle(color: Colors.yellow),
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

          userProfile.update((value) {
            if (value != null && value['uid'] == _auth.currentUser?.uid) {
              value['nama'] = nameController.text;
              value['email'] = emailController.text;
              value['no'] = phoneController.text;
              value['gender'] = genderController.text;
              value['profileImg'] = imageUrl;
            }
          });
          Get.snackbar(
            "",
            "Profil Berhasil Diubah",
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
        } else {
          Get.snackbar(
            "",
            "Isi Semua Data Yang Ada!",
            titleText: const Text(
              'Peringatan',
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
    } catch (e) {
      Get.snackbar(
        "",
        "Terdapat Kesalahan Perubahan",
        titleText: const Text(
          'Error',
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
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final file = File(pickedFile.path);
        if (await file.exists()) {
          setProfileImage(file);
          Get.snackbar(
            "",
            "Gambar berhasil dipilih. Silakan klik Update.",
            titleText: const Text(
              'Informasi',
              style: TextStyle(
                color: Colors.yellow,
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
    } catch (e) {
      Get.snackbar(
        "",
        "Gambar tidak dapat dipilih.",
        titleText: const Text(
          'Error',
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

  void setProfileImage(File file) {
    if (_auth.currentUser != null) {
      profileImageUrl = file.path;
    }
  }

  Future<String> _uploadProfileImage(File file, String userId) async {
    try {
      final ref = _storage.ref().child('profileImages/$userId');
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload profile image.');
    }
  }

  Future<void> updateProfileImage() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        String imageUrl = '';

        if (profileImageUrl.isNotEmpty) {
          final file = File(profileImageUrl);
          imageUrl = await _uploadProfileImage(file, user.uid);
        } else {
          imageUrl = userProfile.value?['profileImg'] ?? '';
        }

        await _firestore.collection("pengelola").doc(user.uid).update({
          "profileImg": imageUrl,
        });

        profileImageUrl = imageUrl;

        userProfile.update((value) {
          if (value != null && value['uid'] == user.uid) {
            value['profileImg'] = imageUrl;
          }
        });

        Get.snackbar(
          "",
          "Profile Image Berhasil Diperbarui.",
          titleText: const Text(
            'Success',
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
      }
    } catch (e) {
      Get.snackbar(
        "",
        "Failed to update profile image.",
        titleText: const Text(
          'Error',
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

  Future<void> deleteImage() async {
    try {
      User? user = _auth.currentUser;

      if (user != null && profileImageUrl.isNotEmpty) {
        final ref = _storage.refFromURL(profileImageUrl);
        await ref.delete();

        await _firestore.collection("pengelola").doc(user.uid).update({
          "profileImg": "",
        });

        profileImageUrl = "";

        userProfile.update((value) {
          if (value != null && value['uid'] == user.uid) {
            value['profileImg'] = "";
          }
        });

        Get.snackbar(
          "",
          "Image Berhasil Dihapus.",
          titleText: const Text(
            'Success',
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
      }
    } catch (e) {
      Get.snackbar(
        "",
        "Failed to delete image.",
        titleText: const Text(
          'Error',
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

  bool _validateInputs() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        genderController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    genderController.dispose();
    super.onClose();
  }
}
