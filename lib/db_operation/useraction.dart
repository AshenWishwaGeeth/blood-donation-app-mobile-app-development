import 'package:flutter_application_1/database/datamodule/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserOperations {
  static Future<Database> _getDatabase() async {
    final String path = join('D:\\flutter_application_1\\db', 'user_database.db'); // Use the provided path
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, username TEXT, firstName TEXT, lastName TEXT, email TEXT, contactNo TEXT, gender TEXT, password TEXT, location TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertUser(User user) async {
    final Database db = await _getDatabase();
    await db.insert(
      'users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<User>> users() async {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('users');

    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        username: maps[i]['username'],
        firstName: maps[i]['firstName'],
        lastName: maps[i]['lastName'],
        email: maps[i]['email'],
        contactNo: maps[i]['contactNo'],
        gender: maps[i]['gender'],
        password: maps[i]['password'],
        location: maps[i]['location'],
      );
    });
  }

  static Future<void> updateUser(User user) async {
    final db = await _getDatabase();
    await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<void> deleteUser(int id) async {
    final db = await _getDatabase();
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
