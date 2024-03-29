import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_app/data/helpers/database_helper.dart';
import 'package:restaurant_app/data/helpers/notification_helper.dart';
import 'package:restaurant_app/data/helpers/schedule_helper.dart';
import 'package:restaurant_app/data/providers/database_provider.dart';
import 'package:restaurant_app/data/providers/restaurant_list_provider.dart';
import 'package:restaurant_app/data/providers/restaurant_detail_provider.dart';
import 'package:restaurant_app/data/providers/restaurant_search_provider.dart';
import 'package:restaurant_app/data/providers/schedule_provider.dart';
import 'package:restaurant_app/data/services/restaurant_services.dart';
import 'package:restaurant_app/data/utils/notification_service.dart';
import 'package:restaurant_app/pages/detail_page.dart';
import 'package:restaurant_app/pages/list_favorite_page.dart';
import 'package:restaurant_app/pages/list_page.dart';
import 'package:restaurant_app/pages/search_page.dart';
import 'package:restaurant_app/pages/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);
  await AndroidAlarmManager.initialize();
  final NotificationService service = NotificationService();
  service.initializeIsolate();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RestaurantDetailProvider>(
          create: (context) => RestaurantDetailProvider(),
        ),
        ChangeNotifierProvider<RestaurantListProvider>(
          create: (context) => RestaurantListProvider(
            restaurantServices: RestaurantServices(),
          ),
        ),
        ChangeNotifierProvider<RestaurantSearchProvider>(
          create: (context) => RestaurantSearchProvider(),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) => DatabaseProvider(
            databaseHelper: DatabaseHelper(),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(
            preferencesHelper: ScheduleHelper(
              sharedPreferences: SharedPreferences.getInstance(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Resto App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          ListPage.routeName: (context) => const ListPage(),
          SearchPage.routeName: (context) => const SearchPage(),
          DetailPage.routeName: (context) => const DetailPage(),
          ListFavoritePage.routeName: (context) => const ListFavoritePage(),
          SettingPage.routeName: (context) => const SettingPage(),
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
      ),
    );
  }
}
