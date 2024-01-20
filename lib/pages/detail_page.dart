import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/providers/restaurant_detail_provider.dart';
import 'package:restaurant_app/widget/carousel_list.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RestaurantDetailProvider>(
        builder: (context, state, _) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.isError) {
            return Center(
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: state.result.id,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            "https://restaurant-api.dicoding.dev/images/medium/${state.result.pictureId}",
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
                            state.result.name,
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
                                state.result.city.toString(),
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
                                state.result.rating.toString(),
                                style: const TextStyle(fontSize: 14),
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Text(
                            state.result.description,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 63, 63, 63),
                                fontSize: 14),
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
                        list: state.result.menus.foods,
                        image:
                            'https://www.imperial.ac.uk/ImageCropToolT4/imageTool/uploaded-images/newseventsimage_1675183852764_mainnews2012_x1.jpg',
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
                        list: state.result.menus.drinks,
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRK545VYmcGkOFuhUHMvr6U1aOxfP96-CN5dAND1RAMYUfY7mB2OquLODJYWN-D0whGlqw&usqp=CAU',
                        price: 'Rp. 15.000',
                      ),
                      const SizedBox(height: 50)
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
