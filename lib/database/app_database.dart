import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase(String createTable) async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'agenda.db');

  return openDatabase(path, onCreate: (db, version) {
    db.execute(createTable);
  }, version: 1);
}
