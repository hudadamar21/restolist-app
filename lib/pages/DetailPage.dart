import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:restoran/types/restaurant.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final restaurant =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    print(restaurant['menus']['foods']);
    print(restaurant['menus']['drinks']);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: restaurant['id'],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      restaurant['pictureId'],
                      width: MediaQuery.of(context).size.width,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant['name'],
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 36, 80, 173),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_pin,
                          size: 16,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          restaurant['city'].toString(),
                          style: const TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          restaurant['rating'].toString(),
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      restaurant['description'],
                      style: const TextStyle(
                          color: Color.fromARGB(255, 63, 63, 63), fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  'Foods',
                  style: TextStyle(
                      color: Color.fromARGB(255, 36, 80, 173),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetuer.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 63, 63),
                    fontSize: 14,
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(height: 250.0),
                  items: restaurant['menus']['foods'].map<Widget>((food) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      'https://www.herofincorp.com/public/admin_assets/upload/blog/64b91a06ab1c8_food%20business%20ideas.webp',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  food['name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  'Rp. 40.000',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '5.0',
                                      style: TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ],
                            ));
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Drinks',
                  style: TextStyle(
                      color: Color.fromARGB(255, 36, 80, 173),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetuer.',
                  style: TextStyle(
                    color: Color.fromARGB(255, 63, 63, 63),
                    fontSize: 14,
                  ),
                ),
                CarouselSlider(
                  options: CarouselOptions(height: 250.0),
                  items: restaurant['menus']['drinks'].map<Widget>((food) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.network(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK545VYmcGkOFuhUHMvr6U1aOxfP96-CN5dAND1RAMYUfY7mB2OquLODJYWN-D0whGlqw&usqp=CAU',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  food['name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  'Rp. 15.000',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(height: 5),
                                const Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Colors.orange,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '4.8',
                                      style: const TextStyle(fontSize: 14),
                                    )
                                  ],
                                ),
                              ],
                            ));
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
