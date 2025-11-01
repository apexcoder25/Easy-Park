import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/core/widgets/custom_button.dart';
import 'package:easy_home/app/core/widgets/custom_dropdown.dart';
import 'package:easy_home/app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/property_form_controller.dart';

class PropertyFormView extends GetView<PropertyFormController> {
  const PropertyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Add / Edit Property",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
          key: controller.formKey,
          child: Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  label: "Property Name",
                  hint: "Enter property name",
                  icon: Icons.business,
                  controller: controller.nameController,
                ),
                const SizedBox(height: 16),

                Obx(() => CustomDropdown(
                      label: "Type",
                      hint: "Select Type",
                      icon: Icons.apartment,
                      items: controller.propertyTypes,
                      value: controller.selectedType.value,
                      onChanged: (val) => controller.selectedType.value = val ?? '',
                    )),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Address",
                  hint: "Enter property address",
                  icon: Icons.location_on,
                  controller: controller.addressController,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "City",
                  hint: "Enter city name",
                  icon: Icons.location_city,
                  controller: controller.cityController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Contact Person",
                  hint: "Enter contact person name",
                  icon: Icons.person,
                  controller: controller.contactPersonController,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Contact Number",
                  hint: "Enter contact number",
                  icon: Icons.phone,
                  controller: controller.contactNumberController,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: "Total Slots",
                  hint: "Enter total slots",
                  icon: Icons.local_parking,
                  controller: controller.totalSlotsController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),

                Obx(() => CustomDropdown(
                      label: "Status",
                      hint: "Select Status",
                      icon: Icons.toggle_on,
                      items: const ["Active", "Inactive"],
                      value: controller.selectedStatus.value,
                      onChanged: (val) => controller.selectedStatus.value = val ?? '',
                    )),
                const SizedBox(height: 28),

                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomButton(
                        text: "Cancel",
                        outline: true,
                        color: AppColors.primary,
                        onTap: () => Get.back(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: CustomButton(
                        text: "Save",
                        color: AppColors.primary,
                        onTap: controller.saveProperty,
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
