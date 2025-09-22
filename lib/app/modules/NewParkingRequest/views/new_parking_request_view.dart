// lib/views/new_parking_request_view.dart
import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/core/widgets/custom_text_field.dart';
import 'package:easy_home/app/modules/NewParkingRequest/components/parking_map_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/new_parking_request_controller.dart';

class NewParkingRequestView extends GetView<NewParkingRequestController> {
  const NewParkingRequestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, // light grey bg
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'New Valet Request',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Color(0xFFE6F0FF),
              child: Icon(Icons.directions_car, color: AppColors.primary),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Customer Information Card
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Customer Information',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                CustomTextField(
  label: 'Phone Number',
  hint: '+1 (555) 123-4567',
  icon: Icons.phone,
),

                  const SizedBox(height: 12),
                 CustomTextField(
  label: 'Vehicle Number',
  hint: 'ABC-1234',
  icon: Icons.directions_car,
),

                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Parking Assignment Card
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Parking Assignment',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  const Text('Select Pillar',
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 12),

                  /// Grid
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildPillarBox('A1', AppColors.primary, true),
                      _buildPillarBox('A2', Colors.grey.shade200, false),
                      _buildPillarBox('A3', Colors.grey.shade200, false),
                      _buildPillarBox('A4', Colors.red.shade100, false),
                      _buildPillarBox('B1', Colors.grey.shade200, false),
                      _buildPillarBox('B2', Colors.grey.shade200, false),
                      _buildPillarBox('B3', Colors.grey.shade200, false),
                      _buildPillarBox('B4', Colors.grey.shade200, false),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// Legend
                  Row(
                    children: [
                      _legendDot(AppColors.primary),
                      const SizedBox(width: 4),
                      const Text('Selected', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 12),
                      _legendDot(Colors.grey.shade300),
                      const SizedBox(width: 4),
                      const Text('Available', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 12),
                      _legendDot(Colors.red.shade100),
                      const SizedBox(width: 4),
                      const Text('Occupied', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// View Parking Map Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE6F0FF),
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                      
  Get.to(() => const ParkingMapDialog(),
      fullscreenDialog: true,
      transition: Transition.rightToLeft);
},

                      
                      icon: const Icon(Icons.map,
                          color: AppColors.primary, size: 20),
                      label: const Text('View Parking Map',
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Assign Worker Card
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Assign Worker',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://via.placeholder.com/150'),
                          radius: 20,
                        ),
                        const SizedBox(width: 12),
                        const Text('John Smith',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14)),
                        const Spacer(),
                        const Icon(Icons.check_circle,
                            color: AppColors.primary),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            /// Bottom Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {},
                    child: const Text('Save as Draft',
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.send, size: 18),
                    label: const Text('Assign & Notify',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Reusable card widget
  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  /// TextField widget styled
  Widget _buildTextField({required String hint, required IconData icon}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey.shade100,
        prefixIcon: Icon(icon, color: Colors.grey),
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
    );
  }

  /// Pillar Box
  Widget _buildPillarBox(String text, Color color, bool selected) {
    return Container(
      width: 60,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Legend Dot
  Widget _legendDot(Color color) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
