import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/property_list_controller.dart';

class PropertyListView extends GetView<PropertyListController> {
  const PropertyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Manage Properties",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search + Filters
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search Property",
                      hintStyle: const TextStyle(color: AppColors.hintTextColor),
                      prefixIcon: const Icon(Icons.search, color: AppColors.textSecondary),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                    ),
                    onChanged: controller.onSearchChanged,
                  ),
                ),
                const SizedBox(width: 8),
               
              ],
            ),

            const SizedBox(height: 16),

            // 📋 Property List
            Expanded(
              child: Obx(() {
                final filtered = controller.filteredProperties;
                if (filtered.isEmpty) {
                  return const Center(
                    child: Text(
                      "No properties found",
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 16,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: filtered.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final property = filtered[index];
                    return _buildPropertyCard(property);
                  },
                );
              }),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: controller.onAddPropertyPressed,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildPropertyCard(Map<String, dynamic> property) {
    final isActive = property['status'] == "Active";

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🏠 Property Name + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                property['name'] ?? "Unnamed Property",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: isActive ? AppColors.selected : AppColors.occupied,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  property['status'] ?? "",
                  style: TextStyle(
                    color: isActive ? Colors.white : AppColors.dangerButtonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // 🏙️ Property Details
          Text(
            "Type: ${property['type'] ?? 'N/A'}",
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          Text(
            "City: ${property['city'] ?? 'N/A'}",
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
          Text(
            "Total Slots: ${property['slots'] ?? 0}",
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
