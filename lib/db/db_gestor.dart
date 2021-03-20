
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBManager {

  static Database _database;
  static final DBManager db = DBManager._();
  DBManager._();


  Future<Database> get database async{

    if(_database != null) return _database;
    _database = await initDB(); /// Crear base de datos y asignarla
    return _database;

  }

  initDB() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, "DogDB.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Dog (id INTEGER PRIMARY KEY, nameDog TEXT, colorDog TEXT, imageDog TEXT)');
        },
    );
  }

  getDogId(int id) async {
    final db = await database;
    final res = db.query('Dog', where: 'id = ?', whereArgs: [id]);
    print("Respuesta del getDogId $res");
  }




}