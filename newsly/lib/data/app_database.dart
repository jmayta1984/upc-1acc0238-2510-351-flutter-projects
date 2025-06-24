import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  // Define your database properties and methods here
  static final String databaseName = 'newsly.db';
  static final int databaseVersion = 1;

  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() {
    return _instance;
  }

  AppDatabase._internal();

  Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database as Database;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), databaseName);
    return await openDatabase(
      path,
      version: databaseVersion,
      onCreate: (db, version) async {
        db.execute('''
          CREATE TABLE news (
            title TEXT primary key,
            author TEXT,
            image TEXT,
            description TEXT
          )
        ''');
      },
    );
  }
}
