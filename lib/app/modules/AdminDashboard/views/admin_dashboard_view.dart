import 'package:easy_home/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/admin_dashboard_controller.dart';

class AdminDashboardView extends GetView<AdminDashboardController> {
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
       
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://www.w3schools.com/howto/img_avatar.png",
              ),
            ),
          ),
        ],
      ),
      body: _buildDashboardBody(context),
    );
  }

  Widget _buildDashboardBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Text(
            "Welcome Back, Admin!",
            style: TextStyle(
              color: Color(0xFF333333),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Here's a summary of your operations.",
            style: TextStyle(
              color: Color(0xFF616161),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          Obx(() {
            final statKeys = controller.stats.keys.toList();
            final statValues = controller.stats.values.toList();

            return GridView.builder(
              itemCount: statKeys.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).size.width > 900 ? 3 : 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (context, index) {
                return _buildDashboardCard(
                  title: statKeys[index],
                  value: statValues[index].toString(),
                  iconUrl: controller.iconUrls[index],
                  progressColor: controller.progressColors[index],
                  progress: controller.progressValues[index],
                  onTap: () => _onCardTap(index),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildDashboardCard({
    required String title,
    required String value,
    required String iconUrl,
    required Color progressColor,
    required double progress,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: progressColor.withOpacity(0.1),
              radius: 20,
              child: Image.network(
                iconUrl,
                height: 22,
                width: 22,
                color: progressColor,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.image_outlined,
                  color: progressColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF616161),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                backgroundColor: const Color(0xFFE0E0E0),
                color: progressColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

void _onCardTap(int index) {
  final selectedKey = controller.stats.keys.elementAt(index);

  switch (selectedKey) {
    case "Total Properties":
      Get.toNamed(Routes.PROPERTY_LIST);
      break;

    case "Total Managers":
      Get.toNamed(Routes.MANAGER_LIST);
      break;

    case "Total Valets":
      Get.toNamed('/valet-list');
      break;

    case "Total Slots":
      Get.toNamed('/slot-list');
      break;

    case "Active Fare Rules":
      Get.toNamed('/fare-rule-list');
      break;

    case "Today's Revenue":
      Get.toNamed('/revenue-report');
      break;

    default:
      Get.snackbar(
        "Navigation",
        "Opening $selectedKey",
        backgroundColor: Colors.white,
        colorText: const Color(0xFF333333),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
      );
  }
}
}
