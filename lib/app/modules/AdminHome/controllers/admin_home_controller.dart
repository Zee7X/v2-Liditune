import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class AdminHomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void logout() async {
    Get.dialog(
      AlertDialog(
        backgroundColor: Color(0Xff252835),
        title: Text(
          'Logout',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Apakah Anda Yakin Ingin Keluar?',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Set the button border radius
              ),
            ),
            onPressed: () {
              Get.back();
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Set the button border radius
              ),
            ),
            onPressed: () async {
              await auth.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<int> countDocuments() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('audioliteratur').get();
      return snapshot.size;
    } catch (e) {
      print('Error counting documents: $e');
      return 0;
    }
  }

  // String getCurrentDateTimeText() {
  //   initializeDateFormatting('id_ID', null);
  //   final now = DateTime.now();
  //   final formatter = DateFormat('EEEE, d MMMM y HH:mm', 'id_ID');
  //   return formatter.format(now);
  // }
}
