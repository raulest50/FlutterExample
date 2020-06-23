import 'package:flutter/material.dart';
import '../img_model.dart';

class ImageList extends StatelessWidget{
  final List<ImageModel> images;

  ImageList(this.images);

  Widget build(context){
    return ListView.builder(
      itemCount: images.length,
      // funcion que configura la apariencia visual de cada elemento del listview
      itemBuilder: (context, int index) {
        return buildImage(images[index]);
      },
    );
  }

  Widget buildImage(ImageModel imgm){
    return Container( // container permite poner margenes y padding
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          width: 4.0,
        ),
      ),
      child: Column(
        children: <Widget>[
          Image.network(imgm.url),
          Padding(
            child: CustomText(imgm.title),
            padding: EdgeInsets.only(
              left: 2.0,
              top: 20.0,
              right: 2.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget CustomText(String txt){
    return Text(
      txt,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.deepOrange,
      ),
    );
  }

}