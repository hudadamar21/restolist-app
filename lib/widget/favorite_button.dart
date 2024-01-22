import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/models/restaurant_detail_model.dart';
import 'package:restaurant_app/data/models/restaurant_model.dart';
import 'package:restaurant_app/data/providers/database_provider.dart';

class FavoriteButton extends StatelessWidget {
  final RestaurantDetail restaurant;

  const FavoriteButton({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder(
          future: provider.isFavorited(restaurant.id),
          builder: (context, snapshot) {
            return Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                color: Colors.red,
                icon: Icon(snapshot.data == false
                    ? Icons.favorite_border
                    : Icons.favorite),
                onPressed: () {
                  if (snapshot.data == false) {
                    provider.addFavorite(restaurant.id);
                  } else {
                    provider.removeFavorite(restaurant.id);
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
