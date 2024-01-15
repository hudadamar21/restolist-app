import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/restaurant_detail.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';

class RestaurantServices {
  Future<RestaurantResult> getRestaurantList() async {
    final response =
        await http.get(Uri.parse("https://restaurant-api.dicoding.dev/list"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant list');
    }
  }

  Future<RestaurantDetailResult> getRestaurantDetail(id) async {
    final response = await http
        .get(Uri.parse("https://restaurant-api.dicoding.dev/detail/$id"));
    if (response.statusCode == 200) {
      return RestaurantDetailResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load restaurant detail');
    }
  }
}
