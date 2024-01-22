import 'package:restaurant_app/data/models/restaurant_favorite_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _instance;
  static Database? _database;

  DatabaseHelper._internal() {
    _instance = this;
  }

  factory DatabaseHelper() => _instance ?? DatabaseHelper._internal();

  static const String _tblFavorite = 'favorites';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/restaurant_favorite.db',
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $_tblFavorite (
             restaurantId TEXT PRIMARY KEY                  
           )     
        ''');
      },
      version: 1,
    );

    return db;
  }

  Future<Database?> get database async {
    _database ??= await _initializeDb();

    return _database;
  }

  Future<void> addToFavorite(String id) async {
    final db = await database;
    try {
      await db?.insert(_tblFavorite, {"restaurantId": id});
      print(id);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<RestaurantFavorite>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db!.query(_tblFavorite);
    print(results);
    return results.map((res) => RestaurantFavorite.fromJson(res)).toList();
  }

  Future<Map> getFavorite(String restaurantId) async {
    final db = await database;

    List<Map<String, dynamic>> results = await db!.query(
      _tblFavorite,
      where: 'restaurantId = ?',
      whereArgs: [restaurantId],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return {};
    }
  }

  Future<void> removeFavorite(String restaurantId) async {
    final db = await database;

    await db!.delete(
      _tblFavorite,
      where: 'restaurantId = ?',
      whereArgs: [restaurantId],
    );
  }
}
