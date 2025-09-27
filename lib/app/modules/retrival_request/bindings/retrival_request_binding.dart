import 'package:get/get.dart';

import '../controllers/retrival_request_controller.dart';

class RetrivalRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RetrivalRequestController>(
      () => RetrivalRequestController(),
    );
  }
}
