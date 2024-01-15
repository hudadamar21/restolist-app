import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/data/provider/restaurant_provider.dart';

import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/widget/resto_card.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/';

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
              return Consumer<RestaurantProvider>(
                builder: (context, resto, _) => RestoCard(
                  data: restoList,
                  onTap: () => {
                    Navigator.pushNamed(
                      context,
                      DetailPage.routeName,
                    ),
                    resto.changeRestaurantId(restoList.id)
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 0),
                  Text(
                    'RestoList',
                    style: TextStyle(
                        color: Color.fromARGB(255, 36, 80, 173),
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 0),
                  Text(
                    'Recomandation restaurant for you!',
                    style: TextStyle(
                        color: Color.fromARGB(255, 63, 63, 63), fontSize: 14),
                  ),
                  SizedBox(height: 20),
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


// List<Resto> parseResto(String? json) {
//   if (json == null) {
//     return [];
//   }

//   final List parsed = jsonDecode(json);
//   return parsed.map((json) => Resto.fromJson(json)).toList();
// }
