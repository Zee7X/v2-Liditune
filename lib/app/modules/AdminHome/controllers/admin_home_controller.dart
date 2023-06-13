import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';



class AdminHomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // void logout() async {
  //   Get.dialog(
  //     AlertDialog(
  //       title: Text('Logout'),
  //       content: Text('Apakah Anda Yakin Ingin Keluar?'),
  //       actions: [
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.blue,
  //             shape: RoundedRectangleBorder(
  //               borderRadius:
  //                   BorderRadius.circular(8), // Set the button border radius
  //             ),
  //           ),
  //           onPressed: () {
  //             Get.back(); // Close the dialog
  //           },
  //           child: Text('Cancel'),
  //         ),
  //         ElevatedButton(
  //           style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.red,
  //             shape: RoundedRectangleBorder(
  //               borderRadius:
  //                   BorderRadius.circular(8), // Set the button border radius
  //             ),
  //           ),
  //           onPressed: () async {
  //             await auth.signOut();
  //             Get.offAllNamed(Routes.LOGIN);
  //           },
  //           child: Text('OK'),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
