import 'package:flutter/material.dart';

class Event {
  final int id;
  late final String title;
  late final String description;
  late final DateTime date;
  final TimeOfDay time;
  final Color color;
  final bool reminder;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.color,
    this.reminder = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'time': '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}',
      'color': color.value,
      'reminder': reminder ? 1 : 0,
    };
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      time: TimeOfDay.fromDateTime(DateTime.parse(json['time'])),
      color: Color(json['color']),
      reminder: json['reminder'],
    );
  }

  Event copyWith({
    String? title,
    String? description,
    DateTime? date,
    TimeOfDay? time,
    Color? color,
    bool? reminder,
  }) {
    return Event(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      time: time ?? this.time,
      color: color ?? this.color,
      reminder: reminder ?? this.reminder,
    );
  }
}