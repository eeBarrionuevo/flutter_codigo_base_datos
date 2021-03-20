import 'package:flutter/material.dart';
import 'package:flutter_codigo_base_datos/db/db_gestor.dart';
import 'package:flutter_codigo_base_datos/models/dog_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Base de datos"),
        ),
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  print(DBManager.db.getDogId(2));
                },
                child: Text("Obtener Perrito ID"),
              ),
              TextButton(
                onPressed: () {
                  Dog chicky = Dog(
                      id: 2,
                      nameDog: "Fideo",
                      colorDog: "Negro",
                      imageDog:
                          "https://images.pexels.com/photos/1805164/pexels-photo-1805164.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");

                  DBManager.db.insertDogRaw(chicky);
                },
                child: Text("Insertar Raw Perrito"),
              ),
              TextButton(
                onPressed: () {
                  Dog perrito = Dog(
                      id: 4,
                      nameDog: "Tobi",
                      colorDog: "Café",
                      imageDog:
                          "https://images.pexels.com/photos/731022/pexels-photo-731022.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940");

                  DBManager.db.insertDog(perrito);
                },
                child: Text("Insertar Perrito"),
              ),
              TextButton(
                onPressed: () {
                  DBManager.db.getAllDogs();
                },
                child: Text("Obtener todos los Perritos"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
