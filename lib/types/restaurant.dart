import 'package:restoran/types/menu.dart';

class Resto {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final num rating;
  final Menus menus;

  Resto({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Resto.fromJson(Map<String, dynamic> restaurant) => Resto(
      id: restaurant['id'],
      name: restaurant['name'],
      description: restaurant['description'],
      pictureId: restaurant['pictureId'],
      city: restaurant['city'],
      rating: restaurant['rating'],
      menus: Menus.fromJson(restaurant['menus']));
}
