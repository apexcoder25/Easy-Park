import 'package:easy_home/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PropertyListController extends GetxController {
  var searchText = "".obs;
  var selectedCity = "".obs;
  var selectedStatus = "".obs;

  // Sample Data
  final properties = [
    {
      "name": "Skyline Mall",
      "type": "Mall",
      "city": "Delhi",
      "slots": 120,
      "status": "Active",
    },
    {
      "name": "Sunrise Hotel",
      "type": "Hotel",
      "city": "Mumbai",
      "slots": 90,
      "status": "Inactive",
    },
    {
      "name": "Ocean View Plaza",
      "type": "Mall",
      "city": "Goa",
      "slots": 75,
      "status": "Active",
    },
    {
      "name": "Elite Towers",
      "type": "Office",
      "city": "Bangalore",
      "slots": 200,
      "status": "Active",
    },
  ].obs;

  final cityList = ["Delhi", "Mumbai", "Goa", "Bangalore"];

  List<Map<String, dynamic>> get filteredProperties {
    return properties.where((p) {
      final matchesSearch = searchText.isEmpty ||
          p["name"].toString().toLowerCase().contains(searchText.value.toLowerCase());
      final matchesCity = selectedCity.isEmpty || p["city"] == selectedCity.value;
      final matchesStatus =
          selectedStatus.isEmpty || p["status"] == selectedStatus.value;
      return matchesSearch && matchesCity && matchesStatus;
    }).toList();
  }

  void onSearchChanged(String query) {
    searchText.value = query;
  }

  void onAddPropertyPressed() {
    Get.toNamed(Routes.PROPERTY_FORM);
  }
}
