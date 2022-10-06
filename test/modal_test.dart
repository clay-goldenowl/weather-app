import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_get/model/city/list_city.dart';
import 'package:weather_get/model/city_detail/city_detail.dart';

void main() {
  group('FetchListCities', () {
    test('FetchListCities', () {
      const String json = '''{
        "results": [
          {
            "id": 2332459,
            "name": "Lagos",
            "latitude": 6.45407,
            "longitude": 3.39467,
            "elevation": 11.0,
            "feature_code": "PPLA2",
            "country_code": "NG",
            "admin1_id": 2332453,
            "timezone": "Africa/Lagos",
            "population": 9000000,
            "country_id": 2328926,
            "country": "Nigeria",
            "admin1": "Lagos"
          }
        ],
        "generationtime_ms": 18.378973
      }''';
      final decode = jsonDecode(json);
      var listCities = ListCity.fromJson(decode);
      final city = listCities.city.first;
      expect(city.latitude, 6.45407);
      expect(city.longitude, 3.39467);
      expect(city.elevation, 11.0);
      expect(city.timezone, "Africa/Lagos");
    });
  });

  group('FetchCityDetail', () {
    test('FetchCityDetail', () {
      const String json = '''{
        "latitude": 6.5,
        "longitude": 3.375,
        "generationtime_ms": 0.22304058074951172,
        "utc_offset_seconds": 3600,
        "timezone": "Africa/Lagos",
        "timezone_abbreviation": "WAT",
        "elevation": 8.0,
        "daily_units": {"time": "iso8601", "temperature_2m_max": "°C"},
        "daily": {
          "time": [
            "2022-10-07",
            "2022-10-08",
            "2022-10-09",
            "2022-10-10",
            "2022-10-11",
            "2022-10-12",
            "2022-10-13"
          ],
          "temperature_2m_max": [28.6, 30.5, 28.4, 29.2, 29.7, 30.0, 27.8]
        }
      }''';
      final decode = jsonDecode(json);
      var city = CityDetail.fromJson(decode);
      expect(city.daily?.temperature2mMax?.first, 28.6);
      expect(city.dailyUnits?.temperature2mMax, "°C");
      expect(city.elevation, 8.0);
    });
  });
}
