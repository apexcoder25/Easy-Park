// // lib/widgets/animated_gradient_text.dart
// import 'dart:math';

// import 'package:flutter/material.dart';

// class AnimatedGradientText extends StatefulWidget {
//   final String text;
//   final TextStyle? style;
//   final List<Color> colors;
//   final Duration duration;

//   const AnimatedGradientText({
//     Key? key,
//     required this.text,
//     required this.colors,
//     this.style,
//     this.duration = const Duration(seconds: 4),
//   }) : super(key: key);

//   @override
//   State<AnimatedGradientText> createState() => _AnimatedGradientTextState();
// }

// class _AnimatedGradientTextState extends State<AnimatedGradientText>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;

//   @override
//   void initState() {
//     _controller = AnimationController(vsync: this, duration: widget.duration)..repeat();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       builder: (context, child) {
//         final angle = _controller.value * 2 * pi;
//         return ShaderMask(
//           blendMode: BlendMode.srcIn, // Ensures text color is preserved under gradient
//           shaderCallback: (bounds) {
//             return LinearGradient(
//               colors: widget.colors,
//               begin: Alignment(-cos(angle), -sin(angle)),
//               end: Alignment(cos(angle), sin(angle)),
//               tileMode: TileMode.mirror,
//             ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
//           },
//           child: Text(
//             widget.text,
//             style: widget.style?.copyWith(color: Colors.white), // Ensure base color is white for gradient
//             textAlign: TextAlign.center,
//           ),
//         );
//       },
//     );
//   }
// }