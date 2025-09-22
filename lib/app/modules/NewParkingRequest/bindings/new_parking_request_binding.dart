import 'package:get/get.dart';

import '../controllers/new_parking_request_controller.dart';

class NewParkingRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewParkingRequestController>(
      () => NewParkingRequestController(),
    );
  }
}
