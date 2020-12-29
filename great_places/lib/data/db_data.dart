import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;


class DataUtil {
  static Future<sql.Database> criadoBancodado() async{
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, "places.db"),
      onCreate: (db, version){
        return db.execute(
          'CREATE TABLE places (id TEXT PRIMARY KEY, title TEXT, imagen TEXT)'
        );
      },
      version: 1,
      
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async{
    final db = await DataUtil.criadoBancodado();
    await db.insert(
      table,
      data, 
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
      
    );

  }

  static Future <List<Map<String, dynamic>>> getData(String table) async{
        final db = await DataUtil.criadoBancodado();
        return db.query(table);
  }
}