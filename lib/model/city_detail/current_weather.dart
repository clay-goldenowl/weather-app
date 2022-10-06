class CurrentWeather {
  double? temperature;
  double? windspeed;
  int? winddirection;
  int? weathercode;
  String? time;

  CurrentWeather({
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.weathercode,
    this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature: (json['temperature'] as num?)?.toDouble(),
      windspeed: (json['windspeed'] as num?)?.toDouble(),
      winddirection: json['winddirection'] as int?,
      weathercode: json['weathercode'] as int?,
      time: json['time'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'temperature': temperature,
        'windspeed': windspeed,
        'winddirection': winddirection,
        'weathercode': weathercode,
        'time': time,
      };
}
