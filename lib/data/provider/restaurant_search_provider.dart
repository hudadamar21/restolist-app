import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_search.dart';
import 'package:restaurant_app/data/service/restaurant_services.dart';

class RestaurantSearchProvider extends ChangeNotifier {
  RestaurantServices restaurantServices = RestaurantServices();

  late RestaurantSearch _result =
      RestaurantSearch(error: false, founded: 0, restaurants: []);
  late bool _isLoading = false;
  late String _message = '';

  String get message => _message;
  bool get isLoading => _isLoading;
  RestaurantSearch get result => _result;

  Future<dynamic> searchRestaurant(String value) async {
    print(value);
    try {
      _result = RestaurantSearch(error: true, founded: 0, restaurants: []);
      _isLoading = true;
      notifyListeners();

      final restaurantLists = await restaurantServices.searchRestaurant(value);

      if (restaurantLists!.restaurants.isEmpty) {
        _isLoading = false;
        notifyListeners();
        return _message = 'Not Found!';
      }

      notifyListeners();
      _isLoading = false;
      print(restaurantLists);
      return _result = restaurantLists;
    } catch (e) {
      if (e is SocketException) {
        _isLoading = false;
        notifyListeners();
        return _message = 'No Internet Connection';
      }

      _isLoading = false;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
