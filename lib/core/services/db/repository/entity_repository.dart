// import 'package:agent/core/services/db/db_service.dart';
// import 'package:agent/core/services/db/entities/base_entity.dart';
// import 'package:agent/core/utils/app_logger_util.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:sqflite/sqflite.dart';
//
// abstract class IDBRepository<T> {
//   Future<List<Map<String, dynamic>>> getAll();
//
//   Future<int> insert(Map<String, dynamic> map);
//
//   Future<void> insertAll(List<Map<String, dynamic>> mapList);
//
//   Future<void> clearTable();
// }
//
// class DBEntityRepository<T extends BaseEntity> implements IDBRepository<T> {
//   static DBEntityRepository get to => Modular.get<DBEntityRepository>();
//
//   Type get getType => T;
//
//   @override
//   Future<List<Map<String, dynamic>>> getAll() async {
//     final db = await DBService.to.getCurrentDb();
//     var map = await db.query(
//       "$getType",
//       orderBy: 'id DESC',
//     );
//     return map;
//   }
//
//   @override
//   Future<int> insert(Map<String, dynamic> map) async {
//     final db = await DBService.to.getCurrentDb();
//     int? i = await db.insert(
//       "$getType",
//       map,
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//     return i;
//   }
//
//   @override
//   Future<void> clearTable() async {
//     final db = await DBService.to.getCurrentDb();
//     AppLoggerUtil.i("clearTable $getType");
//     await db.delete('$getType');
//   }
//
//   @override
//   Future<void> insertAll(List<Map<String, dynamic>> mapList) async {
//     await clearTable();
//     mapList.forEach(
//       (element) async {
//         await insert(element);
//       },
//     );
//   }
// }
