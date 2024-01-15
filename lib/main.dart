import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restoran/pages/detail_page.dart';
import 'package:restoran/pages/list_page.dart';

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(30, 69, 151, 1),
        ),
        useMaterial3: true,
      ),
    );
  }
}
