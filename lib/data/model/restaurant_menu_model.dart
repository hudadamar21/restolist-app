import 'package:restaurant_app/data/model/restaurant_menu_category_model.dart';

class Menu {
  List<MenuCategory> foods;
  List<MenuCategory> drinks;

  Menu({
    required this.foods,
    required this.drinks,
  });

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        foods: List<MenuCategory>.from(
            json["foods"].map((x) => MenuCategory.fromJson(x))),
        drinks: List<MenuCategory>.from(
            json["drinks"].map((x) => MenuCategory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
