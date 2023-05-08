class EventTable {
  static const String tableName = 'events';
  static const String databaseName = 'eventsP4Droid.db';
  static const databaseVersion = 2;

  static const String columnId = 'id';
  static const String columnTitle = 'title';
  static const String columnDescription = 'description';
  static const String columnDate = 'date';
  static const String columnTime = 'time';
  static const String columnColor = 'color';
  static const String columnReminder = 'reminder';

  static const String createTable = '''
    CREATE TABLE $tableName (
      $columnId INTEGER PRIMARY KEY,
      $columnTitle TEXT,
      $columnDescription TEXT,
      $columnDate TEXT,
      $columnTime TEXT,
      $columnColor INTEGER,
      $columnReminder INTEGER
    )
  ''';
}