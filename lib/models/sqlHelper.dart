import 'package:path/path.dart';
import 'package:project_team_3/models/users.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  final String dbName = 'codinggo.db';
  final String tableName = 'users';

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          ''' CREATE TABLE $tableName(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          username TEXT,
          password TEXT,
          email TEXT
          )''',
        );
      },
    );
  }

  // Register a new user
  // Future<int> insertData(Users user) async {
  //   final db = await _openDatabase();
  //   return await db.insert(tableName, user.toMap());
  // }

  // Login user
  // Future<String?> login(Users users) async {
  //   final db = await _openDatabase();
  //   var result = await db.query(tableName,
  //       where: 'email = ? AND password = ?',
  //       whereArgs: [users.email, users.password]);
  //   var getUsername = await db.query(tableName, where: 'email =?', whereArgs: [users.email]);
  //   if (result.isNotEmpty && getUsername.isNotEmpty) {
  //     return result.first['username'] as String;
  //   } else {
  //     return null;
  //   }
  // }

  // Get Username by email for login
  Future<String?> getUsernameByEmail(Users users) async {
    final db = await _openDatabase();
    var result =
        await db.query(tableName, where: 'email =?', whereArgs: [users.email]);
    if (result.isNotEmpty) {
      return result.first['username'] as String;
    } else {
      return null;
    }
  }

  // // Verifikasi jika pengguna terdapat akun yang sama
  // Future<bool> isUserRegistered(String email, String username) async {
  //   final db = await _openDatabase();
  //   var result = await db.query(tableName,
  //       where: 'email = ? AND username = ?', whereArgs: [email, username]);
  //   return result.isNotEmpty;
  // }
}
