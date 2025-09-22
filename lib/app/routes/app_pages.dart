import 'package:easy_home/app/modules/NewParkingRequest/bindings/new_parking_request_binding.dart';
import 'package:easy_home/app/modules/NewParkingRequest/views/new_parking_request_view.dart';
import 'package:get/get.dart';

import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_SCREEN,
      page: () => const LoginScreenView(),
      binding: LoginScreenBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PARKING_REQUEST,
      page: () => const NewParkingRequestView(),
      binding: NewParkingRequestBinding(),
    ),
    
  ];
}
