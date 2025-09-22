// lib/widgets/animated_background.dart
import 'dart:math';

import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 16), // Slightly longer for smoother circular motion
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return SizedBox.expand(
          child: CustomPaint(
            painter: _GradientPainter(_controller.value),
          ),
        );
      },
    );
  }
}

class _GradientPainter extends CustomPainter {
  final double t;
  _GradientPainter(this.t);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final double w = size.width;
    final double h = size.height;

    // Base positions for circular motion
    final baseCenter1X = w * 0.15;
    final baseCenter1Y = h * 0.2;
    final motionRadius1 = min(w, h) * 0.08; // Circular motion radius for gentle orbiting
    final angle1 = t * 2 * pi;
    final center1 = Offset(
      baseCenter1X + motionRadius1 * cos(angle1),
      baseCenter1Y + motionRadius1 * sin(angle1),
    );
    final radius1 = min(w, h) * 0.25; // Circular shape size
    paint.shader = RadialGradient(
      colors: [
        AppColors.primary.withOpacity(0.7),
        AppColors.accent.withOpacity(0.3),
        AppColors.background.withOpacity(0.1),
      ],
      stops: const [0.0, 0.7, 1.0],
      center: const Alignment(0.5, 0.5), // Centered for circular feel
      radius: 1.0,
    ).createShader(Rect.fromCircle(center: center1, radius: radius1));
    canvas.drawCircle(center1, radius1, paint);

    // Base positions for second circle's circular motion
    final baseCenter2X = w * 0.85;
    final baseCenter2Y = h * 0.8;
    final motionRadius2 = min(w, h) * 0.06; // Slightly smaller motion for variety
    final angle2 = t * 2 * pi * 1.3; // Slightly faster for dynamic feel
    final center2 = Offset(
      baseCenter2X + motionRadius2 * cos(angle2),
      baseCenter2Y + motionRadius2 * sin(angle2),
    );
    final radius2 = min(w, h) * 0.3; // Circular shape size
    paint.shader = RadialGradient(
      colors: [
        AppColors.accent.withOpacity(0.6),
        AppColors.primary.withOpacity(0.2),
        AppColors.background.withOpacity(0.05),
      ],
      stops: const [0.0, 0.8, 1.0],
      center: const Alignment(0.5, 0.5), // Centered for circular feel
      radius: 1.0,
    ).createShader(Rect.fromCircle(center: center2, radius: radius2));
    canvas.drawCircle(center2, radius2, paint);

    // Add a third small circular element for more layered circular theme
    final baseCenter3X = w * 0.4;
    final baseCenter3Y = h * 0.5;
    final motionRadius3 = min(w, h) * 0.04;
    final angle3 = t * 2 * pi * 0.7; // Slower motion
    final center3 = Offset(
      baseCenter3X + motionRadius3 * cos(angle3),
      baseCenter3Y + motionRadius3 * sin(angle3),
    );
    final radius3 = min(w, h) * 0.15; // Smaller circle
    paint.shader = RadialGradient(
      colors: [
        AppColors.primary.withOpacity(0.4),
        AppColors.accent.withOpacity(0.15),
        Colors.transparent,
      ],
      stops: const [0.0, 0.6, 1.0],
      center: const Alignment(0.5, 0.5),
      radius: 1.0,
    ).createShader(Rect.fromCircle(center: center3, radius: radius3));
    canvas.drawCircle(center3, radius3, paint);

    // Subtle circular vignette overlay for enhanced circular theme
    final rect = Rect.fromLTWH(0, 0, w, h);
    paint.shader = RadialGradient(
      colors: [
        AppColors.background.withOpacity(0.15),
        Colors.transparent,
      ],
      center: const Alignment(0.5, 0.5),
      radius: 0.8,
    ).createShader(rect);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant _GradientPainter oldDelegate) => oldDelegate.t != t;
}