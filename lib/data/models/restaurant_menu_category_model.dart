class MenuCategory {
  String name;

  MenuCategory({
    required this.name,
  });

  factory MenuCategory.fromJson(Map<String, dynamic> json) => MenuCategory(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
