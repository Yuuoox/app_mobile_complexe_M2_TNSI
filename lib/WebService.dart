import 'dart:convert';

import 'package:http/http.dart' as http;

import 'Nation.dart';
import 'Tank.dart';

class WebService {

  static String url =  "https://api.worldoftanks.eu/wot/";
  static String application_id  = "11068543640dd55137fa2e2c5bbffae5";
  static String language = "fr";

  static Future<List<Nation>> fetchNations() async {
    final response = await http.get(url + "encyclopedia/info/?application_id=" + application_id + "&language=" + language );
    if (response.statusCode == 200) {
      return Nation.fromJson(json.decode(response.body)['data']['vehicle_nations']);
    } else {
      throw Exception('Failed to load nations');
    }
  }

  static Future<List<Tank>> fetchTanks(String nation) async {
    final response = await http.get(url + "encyclopedia/vehicles/?application_id=" + application_id + "&language=" + language + "&nation=" + nation);
    if(response.statusCode == 200){
      return Tank.fromJson(json.decode(response.body)['data']);
    } else {
      print("error");
      throw Exception("Failed to load tanks");
    }
  }

  static Future<List<Tank>> fetchTanksByCriteria(String nation, String type, int tier) async {
    String urlToSend = url + "encyclopedia/vehicles/?application_id=" + application_id + "&language=" + language + "&nation=" + nation;
    (type != "" && type != null) ? urlToSend += "&type=" + type : null;
    (tier != 0) ? urlToSend += "&tier=" + tier.toString() : null;
    final response = await http.get(urlToSend);
    if(response.statusCode == 200){
      return Tank.fromJson(json.decode(response.body)['data']);
    } else {
      print("error");
      throw Exception("Failed to load tanks");
    }
  }

}