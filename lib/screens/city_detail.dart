import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_get/controller/city_detail.dart';
import 'package:weather_get/model/city/city.dart';

class DetailCityScreen extends StatefulWidget {
  const DetailCityScreen({super.key});

  @override
  State<DetailCityScreen> createState() => _DetailCityScreenState();
}

class _DetailCityScreenState extends State<DetailCityScreen> {
  List<City> dataArg = Get.arguments;

  final CityDetailController cityDetailController =
      Get.put(CityDetailController(), permanent: true);

  @override
  void initState() {
    cityDetailController.setLat(dataArg[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx((() {
      var currentWeather = cityDetailController.cityDetail.value;
      var country = dataArg[0].country;
      var city = dataArg[0].admin1;

      return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          centerTitle: true,
        ),
        body: cityDetailController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text('$country - $city',
                      style: const TextStyle(fontSize: 24)),
                  const SizedBox(
                    height: 150,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '${currentWeather.daily?.temperature2mMax?[0].round()}',
                          style: const TextStyle(
                            fontSize: 52,
                            height: 0,
                          )),
                      Text('${currentWeather.dailyUnits?.temperature2mMax}',
                          style: const TextStyle(
                            fontSize: 16,
                            height: 2,
                          ))
                    ],
                  ),
                  Text('Timezone: ${currentWeather.timezone}'),
                  const SizedBox(
                    height: 150,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('The following days',
                            style: TextStyle(fontSize: 16)),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          margin: const EdgeInsets.only(left: 10),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: currentWeather
                                    .daily?.temperature2mMax?.length ??
                                0,
                            itemBuilder: (context, index) {
                              if (index > 0) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                  ),
                                  width: 300,
                                  margin: const EdgeInsets.only(right: 15),
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          '${currentWeather.daily?.time![index]}',
                                          style: const TextStyle(fontSize: 18)),
                                      Text(
                                          '${currentWeather.daily?.temperature2mMax![index].round()} ${currentWeather.dailyUnits?.temperature2mMax}',
                                          style: const TextStyle(fontSize: 18)),
                                    ],
                                  ),
                                );
                              }

                              return Container();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      );
    }));
  }
}
