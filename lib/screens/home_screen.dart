import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_get/controller/home.dart';
import 'package:weather_get/screens/city_detail.dart';
import 'package:weather_get/screens/search_cities.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController =
      Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() => homeController.listCities.isEmpty
                  ? const Center(
                      child: Text('No Cities'),
                    )
                  : _buildListCities()),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: const Color(0xFFE57373),
            onPressed: () async {
              var city = await Get.to(const CitiesScreen());
              homeController.onHandleAddCity(city);
            },
            child: const Icon(Icons.add)));
  }

  Widget _buildListCities() {
    return ListView.builder(
      itemCount: homeController.listCities.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(const DetailCityScreen(),
                arguments: [homeController.listCities[index]]);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${homeController.listCities[index].admin1}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 24),
                    ),
                    const SizedBox(height: 5),
                    Text('City in ${homeController.listCities[index].country}',
                        style: const TextStyle(fontSize: 16))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
