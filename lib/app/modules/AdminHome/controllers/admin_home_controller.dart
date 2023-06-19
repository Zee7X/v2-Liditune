import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class AdminHomeController extends GetxController {
  // FirebaseAuth auth = FirebaseAuth.instance;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Future<void> openCalendarPicker(BuildContext context) async {
    await showDatePicker(
      helpText: '',
      cancelText: '',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogBackgroundColor: Colors.white,
            colorScheme: ColorScheme.light()
                .copyWith(
                  primary: Color(0XFF8058FB),
                )
                .copyWith(background: Colors.white),
          ),
          child: child!,
        );
      },
    );
  }

  String getCurrentDateTimeText() {
    initializeDateFormatting('id_ID', null);
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM y HH:mm', 'id_ID');
    return formatter.format(now);
  }
}
