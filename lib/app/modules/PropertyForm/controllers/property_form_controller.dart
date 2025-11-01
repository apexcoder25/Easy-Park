
import 'package:easy_home/app/core/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PropertyFormController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactNumberController = TextEditingController();
  final totalSlotsController = TextEditingController();

  final selectedType = ''.obs;
  final selectedStatus = ''.obs;

  final propertyTypes = [
    "Hotel",
    "Mall",
    "Hospital",
    "Office",
    "Residential"
  ].obs;

  void saveProperty() {
    if (!_validateForm()) return;

    // Simulate save success
    CustomSnackbar.success(
      "Success",
      "Property saved successfully!",
    );

    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
    });
  }

  bool _validateForm() {
    if (nameController.text.trim().isEmpty ||
        addressController.text.trim().isEmpty ||
        cityController.text.trim().isEmpty ||
        contactPersonController.text.trim().isEmpty ||
        contactNumberController.text.trim().isEmpty ||
        totalSlotsController.text.trim().isEmpty ||
        selectedType.value.isEmpty ||
        selectedStatus.value.isEmpty) {
      CustomSnackbar.error(
        "Validation Error",
        "Please fill all required fields.",
      );
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    contactPersonController.dispose();
    contactNumberController.dispose();
    totalSlotsController.dispose();
    super.onClose();
  }
}
