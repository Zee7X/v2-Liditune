import 'package:get/get.dart';

import '../controllers/add_literatur_controller.dart';

class AddLiteraturBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLiteraturController>(
      () => AddLiteraturController(),
    );
  }
}
