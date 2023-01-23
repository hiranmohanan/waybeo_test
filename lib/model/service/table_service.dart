import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class tableService{
  static const _databasename='app.db';
  static const _databaseversion=1;

  tableService._internal();
  static final tableService tablehelper= tableService._internal();
  static tableService get instance=> tablehelper;

  static Database? _database;

  Future<Database?> get database async{
    if(_database !=null) return _database;
    _database=await _initDatabase();
    return _database;
  }
  Future<Database> _initDatabase( ) async{
    final dbPath=await getDatabasesPath();
    String path= join(dbPath,_databasename);
    return await openDatabase(path,version: _databaseversion,onCreate: _onCreate);
  }
   Future _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE User("
      "day TEXT, "
      "status TEXT, "
      "morning TEXT, "
      "afternoon TEXT "
      "evening TEXT "
     ")"
    );
  }

}