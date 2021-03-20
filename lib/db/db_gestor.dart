
import 'dart:io';

import 'package:flutter_codigo_base_datos/models/dog_model.dart';
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

  Future<Dog> getDogId(int id) async {
    final db = await database;
    final res = await db.query('Dog', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Dog.fromJson(res.first) : null;
  }


  Future<List<Dog>> getAllDogs() async{
    final db = await database;
    final res = await db.query("Dog");
    List<Dog> listDogs = res.isNotEmpty ? res.map((juanito)=>Dog.fromJson(juanito)).toList() : [];
    return listDogs;
  }

  insertDogRaw(Dog perrito) async{
    final db = await database;
    final res = await db.rawInsert(
        "INSERT INTO Dog(id, nameDog, colorDog, imageDog) VALUES(${perrito.id},'${perrito.nameDog}','${perrito.colorDog}','${perrito.imageDog}')"
    );
    print(res);
    return res;
  }

  insertDog(Dog perrito) async {

    final db = await database;
    final res = await db.insert("Dog", perrito.toJson());
    print(res);
    return res;

  }

  updateDog(Dog perrito) async {
    final db = await database;
    final res = await  db.update("Dog", perrito.toJson(), where: 'id = ?', whereArgs: [perrito.id]);
    print(res);
  }





}