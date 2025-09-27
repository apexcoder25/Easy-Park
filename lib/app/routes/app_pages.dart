import 'package:get/get.dart';

import '../modules/CarDelivery/bindings/car_delivery_binding.dart';
import '../modules/CarDelivery/views/car_delivery_view.dart';
import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';
import '../modules/NewParkingRequest/bindings/new_parking_request_binding.dart';
import '../modules/NewParkingRequest/views/new_parking_request_view.dart';
import '../modules/NewParkingRequest/views/park_vehicle_page.dart';
import '../modules/retrival_request/bindings/retrival_request_binding.dart';
import '../modules/retrival_request/views/retrival_request_view.dart';

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
    GetPage(
      name: _Paths.PARK_VEHICLE,
      page: () => const ParkVehiclePage(),
      // binding: NewParkingRequestBinding(), // Add binding if needed
    ),
    GetPage(
      name: _Paths.RETRIVAL_REQUEST,
      page: () => const RetrivalRequestView(),
      binding: RetrivalRequestBinding(),
    ),
    GetPage(
      name: _Paths.CAR_DELIVERY,
      page: () => const CarDeliveryView(),
      binding: CarDeliveryBinding(),
    ),
  ];
}
