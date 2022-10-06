import 'current_weather.dart';
import 'daily.dart';
import 'daily_units.dart';

class CityDetail {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentWeather? currentWeather;
  DailyUnits? dailyUnits;
  Daily? daily;

  CityDetail({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentWeather,
    this.dailyUnits,
    this.daily,
  });

  factory CityDetail.fromJson(Map<String, dynamic> json) => CityDetail(
        latitude: (json['latitude'] as num?)?.toDouble(),
        longitude: (json['longitude'] as num?)?.toDouble(),
        generationtimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
        utcOffsetSeconds: json['utc_offset_seconds'] as int?,
        timezone: json['timezone'] as String?,
        timezoneAbbreviation: json['timezone_abbreviation'] as String?,
        elevation: (json['elevation'] as num?)?.toDouble(),
        currentWeather: json['current_weather'] == null
            ? null
            : CurrentWeather.fromJson(
                json['current_weather'] as Map<String, dynamic>),
        dailyUnits: json['daily_units'] == null
            ? null
            : DailyUnits.fromJson(json['daily_units'] as Map<String, dynamic>),
        daily: json['daily'] == null
            ? null
            : Daily.fromJson(json['daily'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
        'generationtime_ms': generationtimeMs,
        'utc_offset_seconds': utcOffsetSeconds,
        'timezone': timezone,
        'timezone_abbreviation': timezoneAbbreviation,
        'elevation': elevation,
        'current_weather': currentWeather?.toJson(),
        'daily_units': dailyUnits?.toJson(),
        'daily': daily?.toJson(),
      };
}
