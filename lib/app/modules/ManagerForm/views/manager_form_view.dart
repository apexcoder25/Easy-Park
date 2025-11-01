import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/core/utils/snackbar.dart';
import 'package:easy_home/app/core/widgets/custom_button.dart';
import 'package:easy_home/app/core/widgets/custom_dropdown.dart';
import 'package:easy_home/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/manager_form_controller.dart';

class ManagerFormView extends GetView<ManagerFormController> {
  const ManagerFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Text Controllers
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final phoneController = TextEditingController();
    final passwordController = TextEditingController();

    // Dropdown reactive states
    final selectedProperty = ''.obs;
    final selectedStatus = ''.obs;

    // Sample dropdown options
    final propertyOptions = ["Hotel A", "Mall Plaza", "City Center"];
    final statusOptions = ["Active", "Inactive"];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Add / Edit Manager",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 16 : screenWidth * 0.2,
          vertical: 20,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Form(
            key: GlobalKey<FormState>(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: "Name",
                  hint: "Enter manager name",
                  icon: Icons.person_outline,
                  controller: nameController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Email",
                  hint: "Enter manager email",
                  icon: Icons.email_outlined,
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Phone",
                  hint: "Enter phone number",
                  icon: Icons.phone_outlined,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Password",
                  hint: "Enter password",
                  icon: Icons.lock_outline,
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 16),

                // Property Dropdown
                Obx(() {
                  return CustomDropdown(
                    label: "Property",
                    hint: "Select property",
                    icon: Icons.business_outlined,
                    items: propertyOptions,
                    value: selectedProperty.value.isEmpty
                        ? null
                        : selectedProperty.value,
                    onChanged: (val) => selectedProperty.value = val ?? "",
                  );
                }),
                const SizedBox(height: 16),

                // Status Dropdown
                Obx(() {
                  return CustomDropdown(
                    label: "Status",
                    hint: "Select status",
                    icon: Icons.toggle_on_outlined,
                    items: statusOptions,
                    value: selectedStatus.value.isEmpty
                        ? null
                        : selectedStatus.value,
                    onChanged: (val) => selectedStatus.value = val ?? "",
                  );
                }),
                const SizedBox(height: 30),

                // Action Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "Cancel",
                        onTap: () => Get.back(),
                        outline: true,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        text: "Save",
                        onTap: () {
                          if (nameController.text.isEmpty ||
                              emailController.text.isEmpty ||
                              phoneController.text.isEmpty ||
                              passwordController.text.isEmpty ||
                              selectedProperty.value.isEmpty ||
                              selectedStatus.value.isEmpty) {
                            CustomSnackbar.error("Error","Please fill all fields");
                            return;
                          }

                          CustomSnackbar.success("Success",
                              "Manager created successfully");
                          Get.back();
                        },
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
