import 'package:flutter/material.dart';
import 'package:restaurant_app/data/models/restaurant_model.dart';
import 'package:restaurant_app/widget/progressive_image.dart';

class RestoCard extends StatelessWidget {
  final Restaurant data;
  final void Function() onTap;
  const RestoCard({super.key, required this.data, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // In many cases, the key isn't mandatory
        key: ValueKey(data),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 0,
        ),
        child: Row(
          children: [
            Hero(
              tag: data.id,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    children: [
                      ProgressiveImage(
                        image:
                            "https://restaurant-api.dicoding.dev/images/small/${data.pictureId}",
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
                  data.name,
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
                      data.city.toString(),
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
                      data.rating.toString(),
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
