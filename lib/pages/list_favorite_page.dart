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
    return Consumer<DatabaseProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.dataValid) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              return Consumer2<RestaurantListProvider,
                  RestaurantDetailProvider>(
                builder: (context, list, detail, _) => RestoCard(
                  data: list.getRestaurant(state.favorites[index].restaurantId),
                  onTap: () {
                    Navigator.pushNamed(context, DetailPage.routeName);
                    detail.getRestaurantDetail(
                        state.favorites[index].restaurantId);
                  },
                ),
              );
            },
          );
        } else if (state.state == ResultState.error) {
          return Center(
            child: Material(
              child: Text(state.message),
            ),
          );
        } else if (state.favorites.isEmpty) {
          return const Material(child: Text("No Favorite Restaurant"));
        } else {
          return const Material(child: Text(""));
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
