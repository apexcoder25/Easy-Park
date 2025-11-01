import 'package:get/get.dart';

import '../modules/AdminDashboard/bindings/admin_dashboard_binding.dart';
import '../modules/AdminDashboard/views/admin_dashboard_view.dart';
import '../modules/CarDelivery/bindings/car_delivery_binding.dart';
import '../modules/CarDelivery/views/car_delivery_view.dart';
import '../modules/LoginScreen/bindings/login_screen_binding.dart';
import '../modules/LoginScreen/views/login_screen_view.dart';
import '../modules/ManagerForm/bindings/manager_form_binding.dart';
import '../modules/ManagerForm/views/manager_form_view.dart';
import '../modules/ManagerList/bindings/manager_list_binding.dart';
import '../modules/ManagerList/views/manager_list_view.dart';
import '../modules/NewParkingRequest/bindings/new_parking_request_binding.dart';
import '../modules/NewParkingRequest/views/new_parking_request_view.dart';
import '../modules/NewParkingRequest/views/park_vehicle_page.dart';
import '../modules/PropertyForm/bindings/property_form_binding.dart';
import '../modules/PropertyForm/views/property_form_view.dart';
import '../modules/PropertyList/bindings/property_list_binding.dart';
import '../modules/PropertyList/views/property_list_view.dart';
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
    GetPage(
      name: _Paths.ADMIN_DASHBOARD,
      page: () => const AdminDashboardView(),
      binding: AdminDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_LIST,
      page: () => const PropertyListView(),
      binding: PropertyListBinding(),
    ),
    GetPage(
      name: _Paths.PROPERTY_FORM,
      page: () => const PropertyFormView(),
      binding: PropertyFormBinding(),
    ),
    GetPage(
      name: _Paths.MANAGER_LIST,
      page: () => const ManagerListView(),
      binding: ManagerListBinding(),
    ),
    GetPage(
      name: _Paths.MANAGER_FORM,
      page: () => const ManagerFormView(),
      binding: ManagerFormBinding(),
    ),
  ];
}
