import 'package:restoran/types/menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final String rating;
  final List<Menu> menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurant) => Restaurant(
        id: restaurant['id'],
        name: restaurant['name'],
        description: restaurant['description'],
        pictureId: restaurant['pictureId'],
        city: restaurant['city'],
        rating: restaurant['rating'],
        menus: restaurant['menus'],
      );
}
