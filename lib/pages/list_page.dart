import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoran/types/restaurant.dart';
import 'package:restoran/widget/resto_card.dart';

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

List<Resto> parseResto(String? json) {
  if (json == null) {
    return [];
  }

  final List parsed = jsonDecode(json);
  return parsed.map((json) => Resto.fromJson(json)).toList();
}
