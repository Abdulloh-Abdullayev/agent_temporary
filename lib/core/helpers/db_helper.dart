import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static DBHelper get to => Modular.get<DBHelper>();
  late Database database;

  static final String tableOrder = 'table_order';
  static final String tableAgents = 'table_agents';
  static final String columnJsonData = 'json_data';

  Future<DBHelper> init() async {
    var instance = DBHelper();
    final path = await getDatabasesPath();
    instance.database = await openDatabase(
      join(path, 'agent.db'),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE $tableOrder(id INTEGER PRIMARY KEY, storeId TEXT, $columnJsonData Text,);",
        );
        db.execute(
          "CREATE TABLE $tableAgents(id INTEGER PRIMARY KEY, storeId TEXT, $columnJsonData Text,);",
        );
      },
      version: 1,
    );
    return instance;
  }

  static Future<int> add(Map<String, dynamic> data, String table) async {
    final db = DBHelper.to.database;
    var map = {
      columnJsonData: jsonEncode(data),
    };
    int i = await db.insert(
      table,
      map,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return i;
  }
}
