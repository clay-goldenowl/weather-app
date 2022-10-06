import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_get/controller/city.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  final CityController cityController =
      Get.put(CityController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    const borderOutLine = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                children: [
                  TextField(
                    onChanged: (value) => cityController.onSearchChanged(value),
                    decoration: const InputDecoration(
                        border: borderOutLine,
                        focusedBorder: borderOutLine,
                        enabledBorder: borderOutLine,
                        errorBorder: borderOutLine,
                        disabledBorder: borderOutLine,
                        contentPadding: EdgeInsets.only(
                            left: 15, bottom: 11, top: 11, right: 15),
                        hintText: "Hint here"),
                  ),
                  cityController.checkLoading().isTrue
                      ? const Center(
                          child: Padding(
                          padding: EdgeInsets.all(16),
                          child: CircularProgressIndicator(),
                        ))
                      : Expanded(child: _buildListSearch())
                ],
              ),
            )),
      ),
    );
  }

  Widget _buildListSearch() {
    return ListView.builder(
      itemCount: cityController.listCities.length,
      itemBuilder: (context, index) {
        return Container(
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
                    '${cityController.listCities[index].admin1}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text('City in ${cityController.listCities[index].country}',
                      style: const TextStyle(fontSize: 12))
                ],
              ),
              GestureDetector(
                child: const Icon(Icons.add),
                onTap: () {
                  Get.back(result: cityController.listCities[index]);
                  cityController.listCities.value = [];
                },
              )
            ],
          ),
        );
      },
    );
  }
}
