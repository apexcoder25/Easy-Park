import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/retrival_request_controller.dart';


class RetrivalRequestView extends GetView<RetrivalRequestController> {
  const RetrivalRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  backgroundColor: AppColors.background,
  appBar: AppBar(
    automaticallyImplyLeading: false,
    elevation: 0,
    backgroundColor: Colors.white,
    titleSpacing: 0,
    title: Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Retrieval Request',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary),
              ),
              SizedBox(height: 2),
              Text(
                'Assign to available worker',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 16),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: AppColors.available,
          child: Icon(Icons.person, color: AppColors.primary),
        ),
      ),
    ],
  ),

  // All scrollable content goes in body
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _vehicleRetrievalCard(),
        const SizedBox(height: 16),
        _customerInfoCard(),
        const SizedBox(height: 16),
        _availableWorkersSection(),
        const SizedBox(height: 16),
        _autoAssignCard(),
        const SizedBox(height: 100), // gives space so last item not hidden
      ],
    ),
  ),

  // Fixed bottom action bar
  bottomNavigationBar: Container(
    padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 6,
          offset: const Offset(0, -2),
        ),
      ],
    ),
    child: SafeArea(
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: const BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Cancel Request',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed(  Routes.CAR_DELIVERY);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Assign Worker'),
            ),
          ),
        ],
      ),
    ),
  ),
);

  }

  Widget _vehicleRetrievalCard() {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.available,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.directions_car,
                      color: AppColors.primary),
                ),
                const SizedBox(width: 8),
                Text('Vehicle Retrieval',
                    style: AppTextStyles.heading),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.occupied,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Pending',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _detailRow('Request #VR-2024-0156', ''),
            _detailRow('Vehicle Number', 'ABC-1234'),
            _detailRow('Current Location', 'Pillar B-12'),
            _detailRow('Destination', 'Exit Gate A'),
            _detailRow('Request Time', '2:45 PM'),
          ],
        ),
      ),
    );
  }

  Widget _customerInfoCard() {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer Information', style: AppTextStyles.heading),
            const SizedBox(height: 12),
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=3'), // sample
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'John Smith',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '+1 (555) 123-4567',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.call, color: AppColors.primary),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _availableWorkersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text('Available Workers', style: AppTextStyles.heading),
            Text(
              '3 online',
              style: TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _workerTile(
            name: 'Mike Johnson',
            zone: 'Zone A',
            rating: 4.8,
            tasks: 24,
            image:
                'https://i.pravatar.cc/150?img=12'), // sample avatars
        const SizedBox(height: 8),
        _workerTile(
            name: 'Sarah Wilson',
            zone: 'Zone B',
            rating: 4.9,
            tasks: 18,
            image: 'https://i.pravatar.cc/150?img=47'),
        const SizedBox(height: 8),
        _workerTile(
            name: 'David Chen',
            zone: 'Zone C',
            rating: 4.7,
            tasks: 31,
            image: 'https://i.pravatar.cc/150?img=33'),
      ],
    );
  }

  Widget _autoAssignCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.available,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.auto_awesome,
                color: AppColors.primary, size: 24),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'System will assign optimal worker',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Auto Assign'),
          )
        ],
      ),
    );
  }

  Widget _workerTile({
    required String name,
    required String zone,
    required double rating,
    required int tasks,
    required String image,
  }) {
    return Card(
      color: AppColors.card,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: AppColors.border),
      ),
      elevation: 0,
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(image)),
        title: Text(
          name,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        ),
        subtitle: Row(
          children: [
            const Icon(Icons.circle, color: Colors.green, size: 8),
            const SizedBox(width: 4),
            Text('Available • $zone',
                style: const TextStyle(color: AppColors.textSecondary)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 2),
                Text('$rating',
                    style: const TextStyle(color: AppColors.textPrimary)),
              ],
            ),
            Text('$tasks tasks',
                style: const TextStyle(
                    fontSize: 12, color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.label),
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}
