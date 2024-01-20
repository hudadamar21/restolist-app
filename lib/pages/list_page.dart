import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant_list_provider.dart';
import 'package:restaurant_app/data/providers/restaurant_detail_provider.dart';

import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/widget/resto_card.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  Widget _buildList(BuildContext context) {
    return Consumer<RestaurantListProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.state == ResultState.dataValid) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurantResult.restaurants.length,
            itemBuilder: (context, index) {
              var restoList = state.restaurantResult.restaurants[index];
              return Consumer<RestaurantDetailProvider>(
                builder: (context, resto, _) => RestoCard(
                  data: restoList,
                  onTap: () {
                    Navigator.pushNamed(context, DetailPage.routeName);
                    resto.getRestaurantDetail(restoList.id);
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
        } else {
          return const Material(child: Text(''));
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
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RestoList',
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 80, 173),
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'Recomandation restaurant for you!',
                            style: TextStyle(
                                color: Color.fromARGB(255, 63, 63, 63),
                                fontSize: 14),
                          ),
                        ],
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
              Expanded(
                child: ListView.builder(
                  // the number of items in the list
                  itemCount: restolist.length,
                  // display each item of the product list
                  itemBuilder: (context, index) {
                    return RestoCard(
                      restaurant: restolist[index],
                      onTap: () => Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: restolist[index],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
