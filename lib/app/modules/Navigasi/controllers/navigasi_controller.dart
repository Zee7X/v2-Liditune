import 'package:get/get.dart';

class NavigasiController extends GetxController {
  var currentIndex = 0.obs; // Observable for tracking the current index

  void changeTab(int index) {
    currentIndex.value = index; // Update the current index
  }
}
