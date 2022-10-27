import 'package:food_store/database/db_controller.dart';
import 'package:food_store/database/db_operations.dart';
import 'package:food_store/models/product.dart';
import 'package:food_store/pref/shared_pref_controller.dart';
import 'package:sqflite/sqlite_api.dart';

class CartDbController implements DbOperations<Product> {
  final Database _database = DbController().database;

  @override
  Future<int> create(Product model) {
    // int newRowId = await _database.rawInsert(
    //     'INSERT INTO notes (title, info, user_id) VALUES (?, ?, ?)',
    //     [model.title, model.info, model.userId]);
    return _database.insert(Product.tableName, model.toJson());
  }

  @override
  Future<bool> delete(int id) async {
    // int countOfDeletedRows = await _database.rawDelete('DELETE FROM notes WHERE id = ?',[id]);
    int countOfDeletedRows = await _database
        .delete(Product.tableName, where: 'id = ?', whereArgs: [id]);
    return countOfDeletedRows > 0;
  }

  // Future<int> counter(Cart cart) async {
  //   int count = await _database
  //       .rawInsert('INSERT INTO cart (counter) VALUES ?', [cart.counter]);
  //   return count;
  // }

  @override
  Future<List<Product>> read() async {
    // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM notes');

    int userId =
        SharedPrefController().getByKey<int>(key: PrefKey.id.name) ?? -1;
    List<Map<String, dynamic>> rowsMap = await _database
        .query(Product.tableName, where: 'user_id = ?', whereArgs: [userId]);
    return rowsMap.map((rowMap) => Product.fromJson(rowMap)).toList();
  }

  @override
  Future<Product?> show(int id) async {
    // List<Map<String, dynamic>> rowsMap = await _database.rawQuery('SELECT * FROM notes WHERE id = ?', [id]);
    List<Map<String, dynamic>> rowsMap = await _database
        .query(Product.tableName, where: 'id = ?', whereArgs: [id]);
    return rowsMap.isNotEmpty ? Product.fromJson(rowsMap.first) : null;
  }

  @override
  Future<bool> update(Product model) async {
    // int countOfUpdatedRows = await _database.rawUpdate(
    //     'UPDATE notes SET title = ?, info = ? WHERE id = ?',
    //     [model.title, model.info, model.id]);
    int countOfUpdatedRows = await _database.update(
        Product.tableName, model.toJson(),
        where: 'id = ?', whereArgs: [model.id]);
    return countOfUpdatedRows > 0;
  }
}
