import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/data/provider/restaurant_list_provider.dart';
import 'package:restaurant_app/data/provider/restaurant_provider.dart';
import 'package:restaurant_app/data/service/restaurant_services.dart';
import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/pages/list_page.dart';
import 'package:restaurant_app/pages/search_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resto App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ListPage(),
        '/detail': (context) => const DetailPage(),
      },
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        ChangeNotifierProvider<RestaurantListProvider>(
          create: (context) =>
              RestaurantListProvider(restaurantServices: RestaurantServices()),
        ),
      ],
      child: MaterialApp(
        title: 'Resto App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          ListPage.routeName: (context) => const ListPage(),
          SearchPage.routeName: (context) => SearchPage(),
          DetailPage.routeName: (context) => const DetailPage(),
        },
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(30, 69, 151, 1),
          ),
          useMaterial3: true,
        ),
        useMaterial3: true,
      ),
    );
  }
}
