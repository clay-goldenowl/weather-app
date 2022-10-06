import 'dart:async';
import 'package:get/get.dart';
import 'package:weather_get/api/fetch_list_cities.dart';
import 'package:weather_get/model/city/city.dart';

class CityController extends GetxController {
  Timer? _debounce;
  FetchListCities fetchListCities = FetchListCities();

  final RxBool _isLoading = false.obs;
  final RxList<City> listCities = <City>[].obs;

  RxList getList() => listCities;
  RxBool checkLoading() => _isLoading;

  onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 250), () {
      _isLoading.value = true;

      fetchListCities.processData(query).then((value) {
        listCities.value = value;
        _isLoading.value = false;
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
