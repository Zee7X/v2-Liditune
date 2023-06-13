import 'package:get/get.dart';

import '../controllers/literatur_controller.dart';

class LiteraturBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiteraturController>(
      () => LiteraturController(),
    );
  }
}
