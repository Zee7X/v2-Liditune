import 'package:get/get.dart';

import '../controllers/add_pengelola_controller.dart';

class AddPengelolaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPengelolaController>(
      () => AddPengelolaController(),
    );
  }
}
