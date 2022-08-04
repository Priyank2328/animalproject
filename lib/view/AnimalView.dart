import 'dart:convert';
import 'package:animalproject/helpers/ApiHandler.dart';
import 'package:animalproject/provider/AnimalProvider.dart';
import 'package:animalproject/resources/UrlResources.dart';
import 'package:animalproject/view/AnimalDetails.dart';
import 'package:http/http.dart' as http;
import 'package:animalproject/models/Animal.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
class AnimalView extends StatefulWidget {
  @override
  State<AnimalView> createState() => _AnimalViewState();
}
class _AnimalViewState extends State<AnimalView> {
  AnimalProvider provider;
  getdata() async
  {
    await provider.viewanimal(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<AnimalProvider>(context,listen: false);
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AnimalProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Animal"),
      ),
      body:  (provider.alldata!=null)?ListView.builder(
        itemCount: provider.alldata.length,
        itemBuilder: (context,index)
        {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>AnimalDetails(
                          // txtname: provider.alldata[index].name.toString(),
                          // txtlatinname: provider.alldata[index].latinName.toString(),
                          // txtimage: provider.alldata[index].imageLink.toString(),
                          // txtdiet: provider.alldata[index].diet.toString(),
                          // type: provider.alldata[index].animalType.toString(),
                          // time: provider.alldata[index].activeTime.toString(),
                          // lmin: provider.alldata[index].lengthMin.toString(),
                          // lmax: provider.alldata[index].lengthMax.toString(),
                          // wmin: provider.alldata[index].weightMin.toString(),
                          // wmax: provider.alldata[index].weightMax.toString(),
                          // txtlifespan: provider.alldata[index].lifespan.toString(),
                          // txthabitat: provider.alldata[index].habitat.toString(),
                          // txtgeorange: provider.alldata[index].geoRange.toString(),
                          // aid: provider.alldata[index].id.toString(),
                          obj: provider.alldata[index],
                        ))
                      );
                    },
                    child: Card(
                      color: Colors.lightBlueAccent,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Image.network(provider.alldata[index].imageLink.toString(),width: 100.0,),
                          ),
                          SizedBox(height: 20.0,),
                          Text(provider.alldata[index].name.toString()),
                          SizedBox(height: 20.0,),
                          Text(provider.alldata[index].latinName.toString()),
                          SizedBox(height: 20.0,),
                          Text(provider.alldata[index].diet.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ):
      Center(
        child: LoadingAnimationWidget.fourRotatingDots(
          color: Colors.red,
          size: 50,
        ),
      ),
    );
  }
}