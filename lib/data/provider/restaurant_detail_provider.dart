import 'dart:io';

import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/restaurant_detail_model.dart';
import 'package:restaurant_app/data/service/restaurant_services.dart';

class RestaurantDetailProvider extends ChangeNotifier {
  RestaurantServices restaurantServices = RestaurantServices();

  late RestaurantDetail _result;
  late bool _isLoading;
  String _message = '';
  late bool _isError;

  String get message => _message;
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  RestaurantDetail get result => _result;

  RestaurantDetailProvider() {
    getRestaurantDetail('');
  }

  Future<dynamic> getRestaurantDetail(String restaurantId) async {
    try {
      _isLoading = true;
      notifyListeners();

      final data = await restaurantServices.getRestaurantDetail(restaurantId);

      if (data.error) {
        _isLoading = false;
        _isError = true;
        _message = 'Not Found!';
        notifyListeners();
      } else {
        _isLoading = false;
        _isError = false;
        _result = data.restaurant;
        notifyListeners();
      }
    } catch (e) {
      _isError = true;
      if (e is SocketException) {
        _isLoading = false;
        _message = 'No Internet Connection';
        notifyListeners();
      } else {
        _isLoading = false;
        _message = 'Failed to Load Data Restaurant';
        notifyListeners();
      }
    }
  }
}
