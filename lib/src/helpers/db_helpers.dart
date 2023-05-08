import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../constants/db_sqflite_contants.dart';
import '../models/event_model.dart';

class DBHelper {
  static final DBHelper _instance = DBHelper._internal();

  factory DBHelper() => _instance;

  static Database? _database;

  DBHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    try {
      String path = join(await getDatabasesPath(), EventTable.databaseName);
      return await openDatabase(
        path,
        version: EventTable.databaseVersion,
        onCreate: (db, version) async {
          await db.execute(EventTable.createTable);
        },
      );
    } catch (e) {
      // Si se produce una excepción al abrir la base de datos, elimina la base de datos existente y vuelve a crearla.
      await deleteDatabase(join(await getDatabasesPath(), EventTable.databaseName));
      rethrow;
    }
  }

  Future<List<Event>> getEvents() async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(EventTable.tableName);
      return List.generate(maps.length, (i) {
        return Event(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description'],
          date: DateTime.parse(maps[i]['date']),
          time: TimeOfDay(
            hour: int.parse(maps[i]['time'].split(':')[0]),
            minute: int.parse(maps[i]['time'].split(':')[1]),
          ),
          color: Color(maps[i]['color']),
          reminder: maps[i]['reminder'] == 1,
        );
      });
    } catch (e) {
      // Lanza la excepción a la capa superior de la aplicación.
      rethrow;
    }
  }

  Future<void> insertEvent(Event event) async {
    try {
      final db = await database;
      await db.insert(
        EventTable.tableName,
        event.toJson(),
        // conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      // Lanza la excepción a la capa superior de la aplicación.
      rethrow;
    }
  }

  Future<void> updateEvent(Event event) async {
    try {
      final db = await database;
      await db.update(
        EventTable.tableName,
        event.toJson(),
        where: 'id = ?',
        whereArgs: [event.id],
      );
    } catch (e) {
      // Lanza la excepción a la capa superior de la aplicación.
      rethrow;
    }
  }

  Future<void> deleteEvent(int id) async {
    try {
      final db = await database;
      await db.delete(
        EventTable.tableName,
        where: 'id = ?',
        whereArgs: [id],
      );
    } catch (e) {
      // Lanza la excepción a la capa superior de la aplicación.
      rethrow;
    }
  }
}