import 'package:flutter/material.dart';
import 'package:restoran/types/restaurant.dart';
import 'package:restoran/widget/progressive_image.dart';

class RestoCard extends StatelessWidget {
  final Resto restaurant;
  final void Function() onTap;
  const RestoCard({super.key, required this.restaurant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // In many cases, the key isn't mandatory
        key: ValueKey(restaurant),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        child: Row(
          children: [
            Hero(
              tag: restaurant.id,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    children: [
                      ProgressiveImage(
                        image: restaurant.pictureId,
                        height: 100,
                        width: 130,
                      )
                    ],
                  )),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
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
                      restaurant.city.toString(),
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
                      restaurant.rating.toString(),
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
  }
}
