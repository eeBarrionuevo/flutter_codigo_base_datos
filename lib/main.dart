import 'package:flutter/material.dart';
import 'package:flutter_codigo_base_datos/db/db_gestor.dart';

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
                  print(DBManager.db.getDogId(1));
                },
                child: Text("Obtener Perrito ID"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
