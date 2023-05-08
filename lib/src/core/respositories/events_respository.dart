import 'package:flutter/material.dart';
import '../../helpers/db_helpers.dart';
import '../../models/event_model.dart';

class EventRepository {
  final DBHelper dbHelper = DBHelper();

  Future<List<Event>> getEvents() async {
    return await dbHelper.getEvents();
  }

  Future<void> addEvent({
    required String title,
    required String description,
    required DateTime date,
    required TimeOfDay time,
    required Color color,
    bool reminder = false,
  }) async {
    final event = Event(
      id: DateTime.now().millisecondsSinceEpoch,
      title: title,
      description: description,
      date: date,
      time: time,
      color: color,
      reminder: reminder,
    );
    await dbHelper.insertEvent(event);
  }

  Future<void> updateEvent(Event event) async {
    await dbHelper.updateEvent(event);
  }

  Future<void> deleteEvent(int id) async {
    await dbHelper.deleteEvent(id);
  }
}