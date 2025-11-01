import 'package:get/get.dart';

import '../controllers/manager_form_controller.dart';

class ManagerFormBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerFormController>(
      () => ManagerFormController(),
    );
  }
}
