// To parse this JSON data, do
//
//     final restaurantDetail = restaurantDetailFromJson(jsonString);

import 'dart:convert';

import 'package:restaurant_app/data/models/restaurant_detail_model.dart';

RestaurantDetail restaurantDetailFromJson(String str) =>
    RestaurantDetail.fromJson(json.decode(str));

String restaurantDetailToJson(RestaurantDetail data) =>
    json.encode(data.toJson());

class RestaurantDetailResult {
  bool error;
  String message;
  RestaurantDetail restaurant;

  RestaurantDetailResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory RestaurantDetailResult.fromJson(Map<String, dynamic> json) =>
      RestaurantDetailResult(
        error: json["error"],
        message: json["message"],
        restaurant: RestaurantDetail.fromJson(json["restaurant"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "restaurant": restaurant.toJson(),
      };
}
