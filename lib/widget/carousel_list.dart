import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:restaurant_app/widget/progressive_image.dart';

class CarouselList extends StatelessWidget {
  final String title;
  final String description;
  final List list;
  final String image;
  final String price;
  const CarouselList(
      {super.key,
      required this.title,
      required this.description,
      required this.list,
      required this.image,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 36, 80, 173),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        Text(
          description,
          style: const TextStyle(
            color: Color.fromARGB(255, 63, 63, 63),
            fontSize: 14,
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(height: 250.0),
          items: list.map<Widget>((item) {
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
                            child: ProgressiveImage(
                              image: image,
                              height: 150,
                              width: 300,
                              fit: BoxFit.cover,
                            )),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
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
                  ),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
