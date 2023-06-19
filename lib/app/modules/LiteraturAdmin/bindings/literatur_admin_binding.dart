import 'package:get/get.dart';

import '../controllers/literatur_admin_controller.dart';

class LiteraturAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiteraturAdminController>(
      () => LiteraturAdminController(),
    );
  }
}
