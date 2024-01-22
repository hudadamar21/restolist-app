import 'package:flutter/material.dart';
import 'package:restaurant_app/data/enums/ResultState.dart';
import 'package:restaurant_app/data/helpers/database_helper.dart';
import 'package:restaurant_app/data/models/restaurant_favorite_model.dart';

class DatabaseProvider extends ChangeNotifier {
  final DatabaseHelper databaseHelper;

  DatabaseProvider({required this.databaseHelper}) {
    _getFavorites();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<RestaurantFavorite> _favorites = [];
  List<RestaurantFavorite> get favorites => _favorites;

  void _getFavorites() async {
    _state = ResultState.loading;
    notifyListeners();
    final tableFavorite = await databaseHelper.getFavorites();
    _favorites = tableFavorite.cast<RestaurantFavorite>();
    if (_favorites.isNotEmpty) {
      _state = ResultState.dataValid;
    } else {
      _state = ResultState.dataEmpty;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(String id) async {
    try {
      await databaseHelper.addToFavorite(id);
      _getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final favoritedRestaurant = await databaseHelper.getFavorite(id);
    return favoritedRestaurant.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await databaseHelper.removeFavorite(id);
      _getFavorites();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}
