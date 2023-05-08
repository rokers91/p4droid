import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

import '../models/event_model.dart';

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

dynamic guardarMapaCompleto(Map<DateTime, List<Event>> kEventSource){
  final kEvents = LinkedHashMap<DateTime, List<Event>>(
    equals: isSameDay,
    hashCode: getHashCode,
  )..addAll(kEventSource);
  return kEvents;
}
