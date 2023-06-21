import 'package:get/get.dart';

import '../controllers/edit_literatur_controller.dart';

class EditLiteraturBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditLiteraturController>(
      () => EditLiteraturController(),
    );
  }
}
