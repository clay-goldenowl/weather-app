import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_get/model/city_detail/city_detail.dart';

class FetchDataCity {
  Future processData(var lat, var long, var timezone) async {
    var response = await http.get(Uri.parse(apiURL(lat, long, timezone)));
    var jsonString = jsonDecode(response.body);
    var listCities = CityDetail.fromJson(jsonString);

    return listCities;
  }
}

String apiURL(var lat, var long, var timezone) {
  String url;

  url =
      "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&daily=temperature_2m_max&timezone=$timezone";

  return url;
}
