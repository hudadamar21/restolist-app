import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
  late String restaurantId;

  void changeRestaurantId(id) async {
    restaurantId = id;
    notifyListeners();
  }
}
