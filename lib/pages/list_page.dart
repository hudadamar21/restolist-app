import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/data/provider/restaurant_provider.dart';

import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/widget/resto_card.dart';

class ListPage extends StatelessWidget {
  static const routeName = '/';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Resto> restolist = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/restaurant.json');
    final data = await json.decode(response);
    var list = data["restaurants"] as List;
    setState(() {
      restolist = list.map((item) => Resto.fromJson(item)).toList();
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
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
