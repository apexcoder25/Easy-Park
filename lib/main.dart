import 'package:easy_home/app/core/theme/app_theme.dart';
import 'package:easy_home/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Easy Park',
      theme: getAppTheme(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}