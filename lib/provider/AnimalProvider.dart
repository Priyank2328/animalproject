import 'package:animalproject/helpers/ApiHandler.dart';
import 'package:animalproject/helpers/error_handler.dart';
import 'package:animalproject/models/Animal.dart';
import 'package:animalproject/other/NoIntenetConnection.dart';
import 'package:animalproject/resources/UrlResources.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimalProvider with ChangeNotifier
{
  List<Animal> alldata;
  viewanimal(context) async
  {
    try {
      await ApiHandler.get(UrlResources.ANIMAL_VIEW).then((json){
        alldata = json.map<Animal>((obj)=> Animal.fromJson(obj)).toList();
      });
    }
    on ErrorHandler catch (e) {
      if (e.message == "Internet Connection Failure") {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NoIntenetConnection())
        );
      }
    }
  }
}