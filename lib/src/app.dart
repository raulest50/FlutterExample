// import dart helper libraries
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udp/udp.dart';

import 'dart:core';
import 'dart:async';

import 'img_model.dart';
import '../src/widgets/image_list.dart';

// show permite importar solo la funcion get de la libreria ya que los
// demas elementos de la librerian no seran usados en esta app.
import 'package:http/http.dart' show get;

class App extends StatefulWidget {
  createState(){
    return AppState();
  }
}

// create a class, our custom widget
// must extends statelessWidget. must define build method
// that return the widgets *this*  widget will show
class AppState extends State{

  int counter = 0;
  List<ImageModel> listaImg = [];

  Widget build(context){

    SetUDP_Listener();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Irsum App'),
        ),
        body: ImageList(listaImg),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.account_balance),
        ),
      ),
    );
  }

  void fetchImage() async{
    counter++;
    final response = await get('https://jsonplaceholder.typicode.com/photos/$counter');
    final ImageModel imgm = ImageModel.fromRawJson(response.body);

    //changes that need to be rendered on
    setState(() {
      listaImg.add(imgm);
    });

  }

  void FB_Pressed(int counter) async{
    counter++; // se incrementa el contador
    BroadcastTest();
  }

  void SetUDP_Listener() async{
    var receiver = await UDP.bind(Endpoint.loopback(port: Port(12100)));
    // receiving\listening
    await receiver.listen((datagram) {
      var str = String.fromCharCodes(datagram.data);
      print('***************************');
      print('***************************');
      print('***************************');
      print(str);
      MostrarToast(str);
    }, timeout: Duration(seconds: 50));
  }

  ///funcion que hace una prueba de broadcast y detectar la direccion ip del servidor
  void BroadcastTest() async{
    // crea instancia udp para enviar mensajes broadcast desde puerto 65000 de este dispositivo
    var sender = await UDP.bind(Endpoint.any(port: Port(14100)));

    // send a simple string to a broadcast endpoint on port 65001.
    var dataLength = await sender.send("server_broadcast".codeUnits,
        Endpoint.broadcast(port: Port(32100)));
  }

  void MostrarToast(String str){
    Fluttertoast.showToast(
        msg: str,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

}

