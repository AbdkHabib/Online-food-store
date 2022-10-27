import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbController {
  static DbController? _instance;
  late Database _database;

  DbController._();

  factory DbController() {
    return _instance ??= DbController._();
  }

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_db.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database database) {},
      onCreate: (Database database, int version) async {
        await database.execute('CREATE TABLE users ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name TEXT NOT NULL,'
            'email TEXT NOT NULL,'
            'password TEXT NOT NULL'
            ')');


        await database.execute('CREATE TABLE cart ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT,'
            'name_en TEXT ,'
            'name_ar TEXT,'
            'info_en TEXT,'
            'info_ar TEXT,'
            'price TEXT ,'
            'quantity TEXT ,'
            'overal_rate TEXT ,'
            'sub_category_id TEXT ,'
            'product_rate INTEGER ,'
            'offer_price TEXT ,'
            'is_favorite NUMERIC ,'
            'image_url String ,'
            'user_id INTEGER,'
            'mobile_number INTEGER,'
            'FOREIGN KEY (user_id) references users(id)'
            ')');


      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}
