import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  Database? _db; 

  Future<Database> openDb() async {

    _db ??= await openDatabase(join(await getDatabasesPath(), 'easyshoes.db'), version: 1,
      onCreate:(db, version) async {
        await db.execute('CREATE TABLE favorites (id INTEGER PRIMARY KEY, name TEXT, image TEXT, price INTEGER )');
      },
    
    );
    return _db as Database;
  }
  
}