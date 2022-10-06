import 'package:get/get.dart';
import 'package:weather_get/model/city/city.dart';

class HomeController extends GetxController {
  final RxList<City> listCities = <City>[].obs;

  onHandleAddCity(City city) {
    if (!checkCityAlreadyExist(city.id)) {
      listCities.add(city);
    }
  }

  bool checkCityAlreadyExist(int? id) {
    return listCities.indexWhere((element) => element.id == id) >= 0;
  }
}
