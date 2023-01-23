import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
Future<Database> openDb() async {
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, 'tasks.db');

  return await openDatabase(
    path,
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE Tasks(id INTEGER PRIMARY KEY, day INTEGER, task INTEGER, status INTEGER)",
      );
    },
    version: 1,
  );
}
Future<void> insertTaskData(int day, int task, int status) async {
  final db = await openDb();

  await db.insert(
    'Tasks',
    {'day': day, 'task': task, 'status': status},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}
