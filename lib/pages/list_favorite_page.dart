import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/enums/ResultState.dart';
import 'package:restaurant_app/data/providers/database_provider.dart';
import 'package:restaurant_app/data/providers/restaurant_list_provider.dart';
import 'package:restaurant_app/data/providers/restaurant_detail_provider.dart';

import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/widget/resto_card.dart';

class ListFavoritePage extends StatelessWidget {
  static const routeName = '/favorite';

  const ListFavoritePage({super.key});

  Widget _buildList(BuildContext context) {
    return Consumer2<DatabaseProvider, RestaurantListProvider>(
      builder: (context, db, list, _) {
        if (db.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (db.state == ResultState.dataValid &&
            list.state == ResultState.dataValid) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: db.favorites.length,
            itemBuilder: (context, index) {
              return Consumer<RestaurantDetailProvider>(
                builder: (context, detail, _) => RestoCard(
                  data: list.getRestaurant(db.favorites[index].restaurantId),
                  onTap: () {
                    Navigator.pushNamed(context, DetailPage.routeName);
                    detail
                        .getRestaurantDetail(db.favorites[index].restaurantId);
                  },
                ),
              );
            },
          );
        } else if (db.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(db.message),
            ),
          );
        } else if (db.favorites.isEmpty) {
          return const Material(child: Text("No Favorite Restaurant"));
        } else {
          return const Material(
              child: Text(
                  "Something went wrong, \nplease check your internet connection"));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Favorites',
                        style: TextStyle(
                            color: Color.fromARGB(255, 36, 80, 173),
                            fontSize: 32,
                            fontWeight: FontWeight.w600),
                      ),
                      Hero(
                        tag: 'search button',
                        child: IconButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SearchPage.routeName,
                            );
                          },
                          icon: const Icon(Icons.search, size: 30),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              Expanded(child: _buildList(context))
            ],
          ),
        ),
      ),
    );
  }
}
