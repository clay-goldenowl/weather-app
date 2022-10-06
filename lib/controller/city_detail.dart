import 'package:get/get.dart';
import 'package:weather_get/api/fetch_data_city.dart';
import 'package:weather_get/model/city/city.dart';
import 'package:weather_get/model/city_detail/city_detail.dart';

class CityDetailController extends GetxController {
  final RxBool _isLoading = true.obs;
  final cityDetail = CityDetail().obs;

  RxBool checkLoading() => _isLoading;

  FetchDataCity fetchDataCity = FetchDataCity();

  onFetchDetailCity(lat, long, timezone) {
    fetchDataCity.processData(lat, long, timezone).then((value) {
      cityDetail.value = value;
      _isLoading.value = false;
    });
  }

  void setLat(City city) {
    onFetchDetailCity(city.latitude, city.longitude, city.timezone);
  }
}
