import 'dart:async';

import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:test_task/core/data/db/entities/user_entity.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  UserEntity,
])
abstract class AppDatabase extends FloorDatabase {

  static Future<void> initDatabase() async {
    final db =
    await $FloorAppDatabase.databaseBuilder('app_database.db').build();
    GetIt.instance.registerLazySingleton<AppDatabase>(() => db);
  }

  String getQuery(
      String tableName, {
        String? conditions,
        String? orderBy,
        bool isAsc = true,
        String? columns,
      }) {
    String query =
        'SELECT ${columns.isNotNullOrEmpty() ? columns : '*'} FROM $tableName';

    if (conditions.isNotNullOrEmpty()) {
      query += ' WHERE $conditions';
    }

    if (orderBy.isNotNullOrEmpty()) {
      query += ' ORDER BY $orderBy ${isAsc ? 'ASC' : 'DESC'}';
    }

    return query;
  }

  String updateQuery(
      String tableName,
      String? column,
      String? newValue, {
        String? conditions,
      }) {
    String query = 'UPDATE $tableName SET $column = $newValue';

    if (conditions.isNotNullOrEmpty()) {
      query += ' WHERE $conditions';
    }

    return query;
  }

  String deleteQuery(
      String tableName, {
        String? conditions,
      }) {
    String query = 'DELETE FROM $tableName';

    if (conditions.isNotNullOrEmpty()) {
      query += ' WHERE $conditions';
    }

    return query;
  }
}
