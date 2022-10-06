import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_get/model/city/city.dart';
import 'package:weather_get/model/city/list_city.dart';

class FetchListCities {
  Future<List<City>> processData(name) async {
    var response = await http.get(Uri.parse(apiURL(name)));
    var jsonString = jsonDecode(response.body);
    var listCities = ListCity.fromJson(jsonString);
    return listCities.city ?? [];
  }
}

String apiURL(var name) {
  String url;

  url = "https://geocoding-api.open-meteo.com/v1/search?name=$name";

  return url;
}
