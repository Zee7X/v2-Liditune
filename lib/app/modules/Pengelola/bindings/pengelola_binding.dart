import 'package:get/get.dart';

import '../controllers/pengelola_controller.dart';

class PengelolaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengelolaController>(
      () => PengelolaController(),
    );
  }
}
