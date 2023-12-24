import 'package:flutter/material.dart';
import 'package:restoran/types/restaurant.dart';
import 'package:restoran/widget/carousel_list.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final restaurant = ModalRoute.of(context)?.settings.arguments as Resto;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: restaurant.id,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      restaurant.pictureId,
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
                      restaurant.name,
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
                          restaurant.city.toString(),
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
                          restaurant.rating.toString(),
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      restaurant.description,
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
                CarouselList(
                  list: restaurant.menus.foods,
                  image:
                      'https://www.herofincorp.com/public/admin_assets/upload/blog/64b91a06ab1c8_food%20business%20ideas.webp',
                  price: 'Rp. 40.000',
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
                CarouselList(
                  list: restaurant.menus.drinks,
                  image:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK545VYmcGkOFuhUHMvr6U1aOxfP96-CN5dAND1RAMYUfY7mB2OquLODJYWN-D0whGlqw&usqp=CAU',
                  price: 'Rp. 15.000',
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
