// To parse this JSON data, do
//
//     final restaurantResult = restaurantResultFromJson(jsonString);

import 'dart:convert';

import 'package:restaurant_app/data/models/restaurant_model.dart';

RestaurantResult restaurantResultFromJson(String str) =>
    RestaurantResult.fromJson(json.decode(str));

String restaurantResultToJson(RestaurantResult data) =>
    json.encode(data.toJson());

class RestaurantResult {
  bool error;
  String message;
  int count;
  List<Restaurant> restaurants;

  RestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory RestaurantResult.fromJson(Map<String, dynamic> json) =>
      RestaurantResult(
        error: json["error"],
        message: json["message"],
        count: json["count"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "count": count,
        "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}
