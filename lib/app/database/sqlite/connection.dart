//@dart=2.9
import 'dart:async';
import 'package:agenda/app/database/sqlite/scrip.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTable);
        },
      );
    }
    return _db;
  }
}
