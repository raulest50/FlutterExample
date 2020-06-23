
import 'dart:convert';

class ImageModel{
  int id;
  String title;
  String url;

  ImageModel.fromRawJson(String rawJson){
    Map<String, dynamic> Json = json.decode(rawJson);
    this.id = Json['id'];
    this.title = Json['title'];
    this.url = Json['url'];
  }

  ImageModel(this.id, this.url);


}