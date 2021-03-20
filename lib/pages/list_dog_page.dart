import 'package:flutter/material.dart';

class ListDogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de perritos"),
      ),
      body: Center(
        child: FutureBuilder(
          future: getFutureData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data);
            }else{
              return Text("Cargando...");
            }
          },
        ),
      ),
    );
  }

  Future<String> getFutureData() async => await Future.delayed(
        Duration(seconds: 5),
        () {
          return "Data recibida";
        },
      );

  String name(){
    return "Juan";
  }

}
