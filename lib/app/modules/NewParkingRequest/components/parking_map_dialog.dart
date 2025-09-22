import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ParkingMapDialog extends StatefulWidget {
  const ParkingMapDialog({Key? key}) : super(key: key);

  @override
  State<ParkingMapDialog> createState() => _ParkingMapDialogState();
}

class _ParkingMapDialogState extends State<ParkingMapDialog> with TickerProviderStateMixin {
  String currentZone = 'Zone C';
  String? selectedSlot;
  late AnimationController _animationController;
  late AnimationController _carEntranceController;
  late Animation<double> _carXAnimation;

  final Map<String, String> slotStatus = {
    '123': 'available',
    '125': 'available',
    '126': 'occupied',
    '127': 'available',
    '128': 'available',
    '131': 'available',
    '132': 'occupied',
    '134': 'available',
  };

  final List<String> zones = ['Zone A', 'Zone B', 'Zone C', 'Zone D', 'Zc'];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _carEntranceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _carXAnimation = Tween<double>(
      begin: 170.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _carEntranceController,
      curve: Curves.easeOut,
    ));
    _carEntranceController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _animationController.dispose();
    _carEntranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.close, color: AppColors.textPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dubai Marina Parking',
                          style: AppTextStyles.heading.copyWith(fontSize: 18),
                        ),
                        Text(
                          'Courtyard Marina View Tower',
                          style: AppTextStyles.label.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ZONE TABS
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: zones.map((zone) => GestureDetector(
                  onTap: () => setState(() => currentZone = zone),
                  child: _zoneChip(zone, selected: zone == currentZone),
                )).toList(),
              ),
            ),
            const SizedBox(height: 16),

            // GRID OF PARKING SPOTS
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildParkingGrid(),
              ),
            ),

            // CONTINUE BUTTON
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: AppColors.textSecondary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              width: double.infinity,
              child: CustomButton(
                text: 'Continue',
                onTap: () => Navigator.of(context).pop(),
                color: AppColors.primary,
                icon: Icons.arrow_forward,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Zone Chip Widget
  Widget _zoneChip(String title, {bool selected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.selected : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: selected ? Colors.white : AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Parking Grid (2 columns)
  Widget _buildParkingGrid() {
    // Simulated parking slots for left and right
    final leftSlots = ['123', '125', '126', '127', '128'];
    final rightSlots = ['131', '132', '134'];

    return Column(
      children: [
        ...List.generate(leftSlots.length, (index) {
          final leftSlot = leftSlots[index];
          final rightSlot = index < rightSlots.length ? rightSlots[index] : null;
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _parkingSlot(leftSlot)),
                const SizedBox(width: 16),
                if (rightSlot != null) Expanded(child: _parkingSlot(rightSlot)) else const Spacer(),
              ],
            ),
          );
        }),
      ],
    );
  }

  Widget _parkingSlot(String slot) {
    final status = slotStatus[slot] ?? 'available';
    final isSelected = selectedSlot == slot && status == 'available';
    final isOccupied = status == 'occupied';
    final isAvailable = status == 'available' && !isSelected;

    return GestureDetector(
      onTap: () {
        if (isOccupied) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('This slot is occupied')),
          );
        } else {
          if (isSelected) {
            setState(() => selectedSlot = null);
            _carEntranceController.reverse();
          } else {
            setState(() => selectedSlot = slot);
            _carEntranceController.forward(from: 0.0);
          }
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 80,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : isOccupied
                  ? AppColors.occupied
                  : AppColors.available,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.textPrimary
                : isOccupied
                    ? Colors.red.shade300
                    : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (isOccupied)
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  final scale = 0.9 + 0.2 * (_animationController.value);
                  return Transform.scale(
                    scale: scale,
                    child: Positioned(
                      top: -20,
                      child: Image.asset(
                        'assets/images/1444706-middle-removebg-preview.png',
                        width: 170,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              )
            else if (isSelected)
              Positioned(
                left: _carXAnimation.value,
                top: -20,
                child: Image.asset(
                  'assets/images/1444706-middle-removebg-preview.png',
                  width: 170,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
            // Text info at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      slot,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      isOccupied ? 'Occupied' : 'Available',
                      style: TextStyle(
                        fontSize: 12,
                        color: isOccupied ? Colors.red.shade600 : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}