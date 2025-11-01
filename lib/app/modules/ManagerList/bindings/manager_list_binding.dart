import 'package:get/get.dart';

import '../controllers/manager_list_controller.dart';

class ManagerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerListController>(
      () => ManagerListController(),
    );
  }
}
