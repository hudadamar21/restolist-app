import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoran/types/restaurant.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List _restaurants = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/restaurant.json');
    final data = await json.decode(response);
    setState(() {
      _restaurants = data["restaurants"];
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
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.80,
                  child: ListView.builder(
                    // the number of items in the list
                    itemCount: _restaurants.length,
                    // display each item of the product list
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/detail',
                            arguments: _restaurants[index]),
                        child: Container(
                          // In many cases, the key isn't mandatory
                          key: ValueKey(_restaurants[index]),
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 0,
                          ),
                          child: Row(
                            children: [
                              Hero(
                                tag: _restaurants[index]['id'],
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    _restaurants[index]['pictureId'],
                                    width: 130,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _restaurants[index]['name'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 36, 80, 173),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_pin,
                                        size: 15,
                                        color: Colors.green,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _restaurants[index]['city'].toString(),
                                        style: const TextStyle(fontSize: 14),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.orange,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        _restaurants[index]['rating']
                                            .toString(),
                                        style: const TextStyle(fontSize: 12),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
