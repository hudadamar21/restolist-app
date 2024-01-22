class RestaurantFavorite {
  String restaurantId;

  RestaurantFavorite({
    required this.restaurantId,
  });

  factory RestaurantFavorite.fromJson(Map<String, dynamic> json) =>
      RestaurantFavorite(
        restaurantId: json["restaurantId"],
      );

  Map<String, dynamic> toJson() => {
        "restaurantId": restaurantId,
      };
}
