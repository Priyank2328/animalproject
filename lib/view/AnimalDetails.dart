import 'package:animalproject/models/Animal.dart';
import 'package:flutter/material.dart';

class AnimalDetails extends StatefulWidget {
  Animal obj;
  AnimalDetails({this.obj});
  @override
  State<AnimalDetails> createState() => _AnimalDetailsState();
}
class _AnimalDetailsState extends State<AnimalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.green,
          // height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Card(
                    child: Image.network(
                      widget.obj.imageLink,
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Name : "),
                    Text(widget.obj.name),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Latin Name : "),
                    Text(widget.obj.latinName),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Diet : "),
                    Expanded(child: Text(widget.obj.diet)),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Type : "),
                    Text(widget.obj.animalType),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Time : "),
                    Text(widget.obj.activeTime),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Length Min : "),
                    Text(widget.obj.lengthMin),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Length Max : "),
                    Text(widget.obj.lengthMax),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Weight Min : "),
                    Text(widget.obj.weightMin),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Weight Max : "),
                    Text(widget.obj.weightMax),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Life Span : "),
                    Text(widget.obj.lifespan),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Habitat : "),
                    Expanded(child: Text(widget.obj.habitat)),
                  ],
                ),
                SizedBox(height: 20.0,),
                Row(
                  children: [
                    Text("Range : "),
                    Expanded(child: Text(widget.obj.geoRange),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
