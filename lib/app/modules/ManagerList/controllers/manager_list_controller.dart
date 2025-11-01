
import 'package:easy_home/app/core/utils/snackbar.dart';
import 'package:get/get.dart';

class ManagerListController extends GetxController {
  final managers = <Map<String, dynamic>>[].obs;
  final hoveredCard = "".obs;

  @override
  void onInit() {
    super.onInit();
    _loadManagers();
  }

  void _loadManagers() {
    managers.value = [
      {
        "id": "1",
        "name": "Rahul Mehta",
        "email": "rahul@vellyparking.com",
        "phone": "+91 9876543210",
        "propertyName": "City Mall",
        "status": "Active",
      },
      {
        "id": "2",
        "name": "Sneha Kapoor",
        "email": "sneha@vellyparking.com",
        "phone": "+91 9123456789",
        "propertyName": "Grand Hotel",
        "status": "Inactive",
      },
    ];
  }

  void editManager(String id) {
    CustomSnackbar.info(
      "Edit Manager",
      "Editing manager with ID $id",
    );
  }

  void deleteManager(String id) {
    managers.removeWhere((m) => m["id"] == id);
    CustomSnackbar.success(
      "Deleted",
      "Manager deleted successfully.",
    );
  }
}
