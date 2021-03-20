import 'package:flutter/material.dart';
import 'package:flutter_codigo_base_datos/db/db_gestor.dart';
import 'package:flutter_codigo_base_datos/models/dog_model.dart';
import 'package:flutter_codigo_base_datos/pages/home_page.dart';
import 'package:flutter_codigo_base_datos/pages/list_dog_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: ListDogPage()
    );
  }
}
