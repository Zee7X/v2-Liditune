import 'package:get/get.dart';

import '../controllers/scan_ocr_controller.dart';

class ScanOcrBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScanOcrController>(
      () => ScanOcrController(),
    );
  }
}
