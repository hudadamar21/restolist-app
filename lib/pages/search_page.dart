import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant_detail_provider.dart';
import 'package:restaurant_app/data/providers/restaurant_search_provider.dart';

import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/widget/resto_card.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchFieldController = TextEditingController();

  @override
  void dispose() {
    _searchFieldController.dispose();
    super.dispose();
  }

  Widget _buildList(BuildContext context) {
    if (context.watch<RestaurantSearchProvider>().isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (context
        .watch<RestaurantSearchProvider>()
        .result
        .restaurants
        .isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: context.watch<RestaurantSearchProvider>().result.founded,
        itemBuilder: (context, index) {
          var restoList = context
              .watch<RestaurantSearchProvider>()
              .result
              .restaurants[index];
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
    } else if (context
        .watch<RestaurantSearchProvider>()
        .result
        .restaurants
        .isEmpty) {
      return Center(
        child: Material(
          child: Text(context.watch<RestaurantSearchProvider>().message),
        ),
      );
    } else {
      return const Material(child: Text(''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantSearchProvider>(
      create: (context) => RestaurantSearchProvider(),
      builder: (context, child) {
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
                      const Row(
                        children: [
                          Text(
                            'Search',
                            style: TextStyle(
                                color: Color.fromARGB(255, 36, 80, 173),
                                fontSize: 32,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchFieldController,
                              onSubmitted: (value) {
                                if (value.isEmpty) return;
                                Provider.of<RestaurantSearchProvider>(
                                  context,
                                  listen: false,
                                ).searchRestaurant(_searchFieldController.text);
                              },
                              decoration: InputDecoration(
                                hintText: 'Search..',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                contentPadding: const EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Hero(
                            tag: 'search button',
                            child: IconButton(
                              onPressed: () {
                                if (_searchFieldController.text.isEmpty) return;
                                Provider.of<RestaurantSearchProvider>(
                                  context,
                                  listen: false,
                                ).searchRestaurant(_searchFieldController.text);
                              },
                              icon: const Icon(
                                Icons.search,
                                size: 30,
                              ),
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
      },
    );
  }
}
