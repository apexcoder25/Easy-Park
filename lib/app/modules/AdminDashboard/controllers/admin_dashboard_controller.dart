import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboardController extends GetxController {
  var stats = {
    "Total Properties": 24,
    "Total Managers": 12,
    "Total Valets": 78,
    "Total Slots": 1250,
    "Active Fare Rules": 8,
    "Today's Revenue": "\$4,320",
  }.obs;

  final iconUrls = [
    "https://cdn-icons-png.flaticon.com/512/869/869636.png", // Properties
    "https://cdn-icons-png.flaticon.com/512/3135/3135715.png", // Managers
    "https://cdn-icons-png.flaticon.com/512/2922/2922510.png", // Valets
    "https://cdn-icons-png.flaticon.com/512/854/854878.png", // Slots
    "https://cdn-icons-png.flaticon.com/512/1828/1828843.png", // Fare Rules
    "https://cdn-icons-png.flaticon.com/512/1170/1170576.png", // Revenue
  ];

  final progressColors = [
    const Color(0xFF006afd),
    const Color(0xFF4CAF50),
    const Color(0xFF9C27B0),
    const Color(0xFFFF9800),
    const Color(0xFFF44336),
    const Color(0xFF26A69A),
  ];

  final progressValues = [0.7, 0.6, 0.8, 0.5, 0.4, 0.9];
}
