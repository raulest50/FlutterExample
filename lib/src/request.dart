import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

String url_webapp = "192.168.0.15:3000";
String route = "buscar_producto";

void GetRequest( Map<String, String> parametros, VoidCallback callback ) async{
  var params = {'nombre':'rojo'};
  var get_url= Uri.http(url_webapp, route, parametros);
  var respuesta = await http.get(get_url);
  print('${respuesta.body}');
  print(respuesta.statusCode);
  callback();
}