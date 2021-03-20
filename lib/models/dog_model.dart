

class Dog{

  int id;
  String nameDog;
  String colorDog;
  String imageDog;


  Dog({this.id, this.nameDog, this.colorDog, this.imageDog });

  //Convertir de un Json a el modelo
   factory Dog.fromJson(Map<String, dynamic> json) => Dog(
     id: json["id"],
     nameDog : json["nameDog"],
     colorDog: json["colorDog"],
     imageDog: json["imageDog"]
   );

  //Convertir el modelo a un Json
  Map<String, dynamic> toJson() => {
    "id" : id,
    "nameDog" : nameDog,
    "colorDog" : colorDog,
    "imageDog" : imageDog
  };


}

