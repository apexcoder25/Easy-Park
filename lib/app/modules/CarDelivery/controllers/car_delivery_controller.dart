import 'package:get/get.dart';

enum DeliveryStep {
  carRetrieved,
  driveToPickup,
  meetCustomer,
  markDelivered,
}

class CarDeliveryController extends GetxController {
  final activeStep = DeliveryStep.driveToPickup.obs; 

  void nextStep() {
    switch (activeStep.value) {
      case DeliveryStep.carRetrieved:
        activeStep.value = DeliveryStep.driveToPickup;
        break;
      case DeliveryStep.driveToPickup:
        activeStep.value = DeliveryStep.meetCustomer;
        break;
      case DeliveryStep.meetCustomer:
        activeStep.value = DeliveryStep.markDelivered;
        break;
      case DeliveryStep.markDelivered:
        break;
    }
  }

  bool isStepCompleted(DeliveryStep step) {
    return activeStep.value.index > step.index;
  }

  bool isStepActive(DeliveryStep step) {
    return activeStep.value == step;
  }
}
