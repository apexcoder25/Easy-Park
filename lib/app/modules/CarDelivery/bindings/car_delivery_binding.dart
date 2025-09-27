import 'package:get/get.dart';

import '../controllers/car_delivery_controller.dart';

class CarDeliveryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarDeliveryController>(
      () => CarDeliveryController(),
    );
  }
}
