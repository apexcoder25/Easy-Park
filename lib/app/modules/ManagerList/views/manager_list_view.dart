import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/manager_list_controller.dart';

class ManagerListView extends GetView<ManagerListController> {
  const ManagerListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Managers",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          if (controller.managers.isEmpty) {
            return const Center(
              child: Text(
                "No managers available.",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: controller.managers.length,
            itemBuilder: (context, index) {
              final manager = controller.managers[index];
              return _buildManagerCard(manager, context, screenWidth);
            },
          );
        }),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () => Get.toNamed('/manager-form'),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildManagerCard(
      Map<String, dynamic> manager, BuildContext context, double screenWidth) {
    final bool isActive = manager["status"] == "Active";
    final isMobile = screenWidth < 600; // responsive breakpoint

    return MouseRegion(
      onEnter: (_) => controller.hoveredCard.value = manager["id"],
      onExit: (_) => controller.hoveredCard.value = "",
      child: Obx(() {
        final isHovered = controller.hoveredCard.value == manager["id"];
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFFE3F2FD) : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadowColor,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: isMobile
              ? _buildVerticalLayout(manager, isActive)
              : _buildHorizontalLayout(manager, isActive, screenWidth),
        );
      }),
    );
  }

  /// 📱 Vertical layout for small screens
  Widget _buildVerticalLayout(Map<String, dynamic> manager, bool isActive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          manager["name"] ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          manager["email"] ?? "",
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          manager["phone"] ?? "",
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "Property: ${manager["propertyName"] ?? "-"}",
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _statusChip(isActive, manager["status"] ?? ""),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.grey),
                  onPressed: () => controller.editManager(manager["id"]),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.grey),
                  onPressed: () => controller.deleteManager(manager["id"]),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /// 💻 Horizontal layout for large screens
  Widget _buildHorizontalLayout(
      Map<String, dynamic> manager, bool isActive, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Manager Info Section
        SizedBox(
          width: screenWidth * 0.45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                manager["name"] ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                manager["email"] ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                manager["phone"] ?? "",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Property: ${manager["propertyName"] ?? "-"}",
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),

        // Status Badge
        SizedBox(
          width: screenWidth * 0.25,
          child: Align(
            alignment: Alignment.centerLeft,
            child: _statusChip(isActive, manager["status"] ?? ""),
          ),
        ),

        // Action Buttons
        SizedBox(
          width: screenWidth * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.grey),
                onPressed: () => controller.editManager(manager["id"]),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.grey),
                onPressed: () => controller.deleteManager(manager["id"]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// 🏷️ Reusable Status Chip
  Widget _statusChip(bool isActive, String statusText) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF4FC3F7) : const Color(0xFFFFEAEA),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusText,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.red,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
