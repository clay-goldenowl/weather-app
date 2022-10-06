import 'city.dart';

class ListCity {
  List<City> city;
  double? generationtimeMs;

  ListCity({required this.city, this.generationtimeMs});

  factory ListCity.fromJson(Map<String, dynamic> json) => ListCity(
        city: (json['results'] as List<dynamic>?)
                ?.map((e) => City.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
        generationtimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'results': city.map((e) => e.toJson()).toList(),
        'generationtime_ms': generationtimeMs,
      };
}
