import 'package:easy_home/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  late TextEditingController emailManager;
  late TextEditingController passManager;
  late TextEditingController emailStaff;
  late TextEditingController passStaff;

  final obscureManager = true.obs;
  final obscureStaff = true.obs;

  @override
  void onInit() {
    super.onInit();
    emailManager = TextEditingController();
    passManager = TextEditingController();
    emailStaff = TextEditingController();
    passStaff = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailManager.dispose();
    passManager.dispose();
    emailStaff.dispose();
    passStaff.dispose();
    super.onClose();
  }

  void toggleObscureManager() => obscureManager.value = !obscureManager.value;
  void toggleObscureStaff() => obscureStaff.value = !obscureStaff.value;

  void loginManager() {
    // TODO: Implement actual login logic (e.g., API call, validation)
    final email = emailManager.text.trim();
    final password = passManager.text;
            Get.toNamed(Routes.NEW_PARKING_REQUEST);
    

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password', snackPosition: SnackPosition.TOP);
      return;
    }
    print('Attempting to login as manager with email: $email');
    // Example: Get.toNamed('/dashboard'); // Navigate on success
  }

  void loginStaff() {

    final email = emailStaff.text.trim();
    final password = passStaff.text;
        Get.toNamed(Routes.NEW_PARKING_REQUEST);
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please enter email and password', snackPosition: SnackPosition.TOP);
      Get.toNamed(Routes.NEW_PARKING_REQUEST);
      return;
    }
    print('Attempting to login as staff with email: $email');
    // Example: Get.toNamed('/staff-dashboard'); // Navigate on success
  }
}