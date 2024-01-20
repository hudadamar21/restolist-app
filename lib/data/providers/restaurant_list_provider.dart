import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant_result_model.dart';
import 'package:restaurant_app/data/services/restaurant_services.dart';

enum ResultState {
  loading,
  dataEmpty,
  dataValid,
  error,
}

class RestaurantListProvider extends ChangeNotifier {
  final RestaurantServices restaurantServices;

  RestaurantListProvider({required this.restaurantServices}) {
    getAllRestaurant();
  }

  late RestaurantResult _restaurantResult;
  late ResultState _state;

  String _message = '';

  String get message => _message;
  RestaurantResult get restaurantResult => _restaurantResult;
  ResultState get state => _state;

  Future<dynamic> getAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      final restaurantList = await restaurantServices.getRestaurantList();

      if (restaurantList.restaurants.isEmpty) {
        _state = ResultState.dataEmpty;
        notifyListeners();
        return _message = 'Empty Data';
      }

      _state = ResultState.dataValid;
      notifyListeners();
      return _restaurantResult = restaurantList;
    } catch (e) {
      if (e is SocketException) {
        _state = ResultState.error;
        notifyListeners();
        return _message = 'No Internet Connection.';
      }

      _state = ResultState.error;
      notifyListeners();
      return _message = 'Failed to Load Data';
    }
  }
}
