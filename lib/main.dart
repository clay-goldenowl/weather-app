import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:weather_get/screens/city_detail.dart';
import 'package:weather_get/screens/home_screen.dart';

import 'screens/search_cities.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetMaterialApp(
        home: const HomeScreen(),
        getPages: [
          GetPage(name: '/', page: () => const HomeScreen()),
          GetPage(name: '/search-city', page: () => const CitiesScreen()),
          GetPage(name: '/detail-city', page: () => const DetailCityScreen()),
        ],
      ),
    );
  }
}
