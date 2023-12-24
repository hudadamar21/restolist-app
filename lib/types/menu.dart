class Menu {
  final String name;
  Menu({required this.name});

  factory Menu.fromJson(Map<String, dynamic> menu) => Menu(name: menu['name']);
}

class Menus {
  List<Menu> foods;
  List<Menu> drinks;

  Menus({required this.foods, required this.drinks});

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods:
            (json['foods'] as List).map((item) => Menu.fromJson(item)).toList(),
        drinks: (json['drinks'] as List)
            .map((item) => Menu.fromJson(item))
            .toList(),
      );
}
